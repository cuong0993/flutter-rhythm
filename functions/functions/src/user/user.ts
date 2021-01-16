import * as firebase from 'firebase-admin';
import { User } from '../model/user';
import { FirebasePath } from '../firebase-path';
import { EventContext } from 'firebase-functions';
import UserRecord = firebase.auth.UserRecord;
import { HttpsError } from 'firebase-functions/lib/providers/https';

export function onUserSignUp(user: UserRecord, _: EventContext): Promise<void> {
  return firebase.firestore().runTransaction(async (transaction): Promise<void> => {
    const userRef = firebase
      .firestore()
      .collection(FirebasePath.FIREBASE_PATH_USERS)
      .doc(user.uid);
    const newUser: User = {
      id: user.uid,
      playedNotes: 0,
      stars: 0,
      playedTime: 0,
      instrumentId: 'piano',
      notificationTokens: [],
    };
    transaction.set(userRef, newUser);
    console.log(`Create profile success ${user.uid}`);
  });
}

export function onUserDeleted(userRecord: UserRecord): Promise<void> {
  return firebase.firestore().runTransaction(async (transaction): Promise<void> => {
    const userRef = firebase
      .firestore()
      .collection(FirebasePath.FIREBASE_PATH_USERS)
      .doc(userRecord.uid);
    const userSnapshot = await transaction.get(userRef);
    if (!userSnapshot.exists) {
      console.log('Cannot retrieve user information');
      throw new HttpsError('unavailable', 'Cannot retrieve user information');
    }
    const user = <User>userSnapshot.data();
    transaction.delete(userRef);
    console.log(`Deleted profile ${user.id}`);
  });
}
