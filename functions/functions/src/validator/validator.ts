import {
  CallableContext,
  HttpsError,
} from 'firebase-functions/lib/providers/https';
import { google } from 'googleapis';
const serviceAccount = require('../../service_account.json');
import * as firebase from 'firebase-admin';
import { SubscriptionPurchaseImpl } from './purchases-impl';
import { getUserId } from '../shared';
import { FirebasePath } from '../firebase-path';

export enum PurchaseQueryError {
  InvalidToken = 'InvalidToken',
  OtherError = 'OtherError',
}

const jwtClient = new google.auth.JWT(
  serviceAccount.client_email,
  undefined,
  serviceAccount.private_key,
  ['https://www.googleapis.com/auth/androidpublisher'],
  undefined,
);
const playDeveloperApiClient = google.androidpublisher({
  version: 'v3',
  auth: jwtClient,
});

export async function verifyPurchase(data: any, context: CallableContext, packageName: string): Promise<void> {
  const sku = data.sku;
  const token = data.token;
  const isSubscription = data.isSubscription;
  const userId = getUserId(context);

  if (!isSubscription) {
    console.log('Only support subscription');
    throw new HttpsError('unimplemented', 'Only support subscription');
  }
  const subscription: SubscriptionPurchaseImpl = await updateSubscription(token, sku, packageName, userId);
  const firestore = firebase.firestore();
  const userRef = firestore.collection(FirebasePath.FIREBASE_PATH_USERS).doc(userId);
  if (subscription.canceled) {
    console.log('Subscription is canceled, user is still free');
    throw new HttpsError('resource-exhausted', 'Subscription is canceled');
  } else {
    console.log('Subscription is active, make user premium');
    userRef.update({ free: false, premiumDueDate: new Date(subscription.expiryTimeMillis) });
  }
}

export async function checkIfExpiredSubscriptionsRenewed(): Promise<any> {
  const firestore = firebase.firestore();
  const currentMillis = (new Date()).getTime();
  const snapshot = await firestore.collection('purchases').where('canceled', '==', false).where('expiryTimeMillis', '<=', currentMillis).get();
  console.log(`Found ${snapshot.docs.length} expired subscriptions`);
  snapshot.forEach(async (doc): Promise<any> => {
    const purchase = <SubscriptionPurchaseImpl>doc.data();
    console.log(`Checking a purchase with token ${purchase.purchaseToken}, sku ${purchase.sku}, userId ${purchase.userId!}`);
    const subscription: SubscriptionPurchaseImpl = await updateSubscription(purchase.purchaseToken, purchase.sku, purchase.packageName, purchase.userId!);
    const userRef = firestore.collection(FirebasePath.FIREBASE_PATH_USERS).doc(purchase.userId!);
    if (subscription.canceled) {
      console.log('Subscription is canceled, make user free');
      userRef.update({ free: true, premiumDueDate: new Date(0) });
    } else {
      console.log('Subscription is active, make user premium');
      userRef.update({ free: false, premiumDueDate: new Date(subscription.expiryTimeMillis) });
    }
  });
}

async function updateSubscription(purchaseToken: string, sku: string, packageName: string, userId: string): Promise<SubscriptionPurchaseImpl> {
  const firestore = firebase.firestore();
  console.log(`Checking the subscription sku ${sku}, purchaseToken ${purchaseToken}, packageName ${packageName}, userId ${userId}`);
  const apiResponse = await playDeveloperApiClient.purchases.subscriptions.get({
    packageName,
    token: purchaseToken,
    subscriptionId: sku,
  });
  console.log(`Found subscription Id ${apiResponse.data.orderId}`);

  const now = Date.now();
  const purchase = SubscriptionPurchaseImpl.fromApiResponse(apiResponse.data, packageName, purchaseToken, sku, now);
  purchase.userId = userId;
  const purchaseRef = firestore.collection('purchases').doc(purchaseToken);
  if (purchase.cancelReason >= 0) {
    console.log('Subscription is canceled');
    purchase.canceled = true;
  } else {
    console.log('Subscription is active');
    purchase.canceled = false;
  }
  purchaseRef.set(purchase.toFirestoreObject());
  console.log('Finished checking the subscription');
  return purchase;
}
