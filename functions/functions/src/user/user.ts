import * as firebase from 'firebase-admin';
import { User } from '../model/user';
import { FirebasePath } from '../firebase-path';
import { EventContext } from 'firebase-functions';
import UserRecord = firebase.auth.UserRecord;
import { HttpsError } from 'firebase-functions/lib/providers/https';

export const maxLevelExperiences = [0, 2000, 4000, 10000, 20000, 40000, 100000, 200000, 500000, 1000000, 3000000, 4000000, 8000000];

export function onUserSignUp(user: UserRecord, _: EventContext): Promise<void> {
  return firebase.firestore().runTransaction(async (transaction): Promise<void> => {
    const userRef = firebase
      .firestore()
      .collection(FirebasePath.FIREBASE_PATH_USERS)
      .doc(user.uid);
    const startLevel = 1;
    const newUser: User = {
      id: user.uid,
      level: startLevel,
      experience: 0,
      maxLevelExperience: maxLevelExperiences[startLevel],
      instrumentId: 'piano',
      free: true,
      premiumDueDate: new Date(0),
      nextTimeReward: new Date(),
      coins: 50,
      boughtSongs: [],
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
