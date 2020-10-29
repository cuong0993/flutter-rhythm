import { FirebasePath } from '../firebase-path';
import * as firebase from 'firebase-admin';
import {
  CallableContext,
  HttpsError,
} from 'firebase-functions/lib/providers/https';
import { getUserId } from '../shared';
import { User } from '../model/user';
import { Reward } from '../model/reward';

export async function takeReward(_: any, context: CallableContext): Promise<Reward> {
  const userId = getUserId(context);
  console.log(`User ${userId} is taking the login reward`);
  const firestore = firebase.firestore();
  return firestore.runTransaction(async (transaction): Promise<Reward> => {
    const userRef = firestore
      .collection(FirebasePath.FIREBASE_PATH_USERS)
      .doc(userId);
    const userSnapshot = await transaction.get(userRef);
    if (!userSnapshot.exists) {
      console.log('Cannot retrieve user information');
      throw new HttpsError('unavailable', 'Cannot retrieve user information');
    }
    const user = userSnapshot.data() as User;
    const date = new Date();
    const toleranceMilliseconds = 60000; // 1 minute
    if (
      new Date(user.nextTimeReward).getTime() >=
      date.getTime() + toleranceMilliseconds
    ) {
      console.log('Cannot get reward too soon');
      throw new HttpsError('unavailable', 'Cannot get reward too soon');
    }
    const durationRewardMilliseconds = 10 * 60 * 60 * 1000; // 10 hours

    user.nextTimeReward = new Date(
      date.getTime() + durationRewardMilliseconds,
    );

    const reward: Reward = {
      coins: 10,
      nextRewardMilliseconds: durationRewardMilliseconds,
    };

    user.coins += reward.coins;

    transaction.set(userRef, user);
    console.log(`The reward is ${JSON.stringify(reward)}`);
    return reward;
  });
}
