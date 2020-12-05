import {
  HttpsError,
  CallableContext,
} from 'firebase-functions/lib/providers/https';
import { FirebasePath } from '../firebase-path';
import * as firebase from 'firebase-admin';
import { getUserId } from '../shared';
import { Song } from '../model/song';
import { GameReward } from '../model/game-reward';
import { User } from '../model/user';

export async function getGameReward(
  data: any,
  context: CallableContext,
): Promise<GameReward> {
  const songId = <string>data.songId;
  const difficulty = <number>data.difficulty;
  const speed = <number>data.speed;
  const errorCount = <number>data.errorCount;

  const userId = getUserId(context);
  console.log(`User ${userId} is getting game reward with songId ${songId}, difficulty ${difficulty}, speed ${speed}, errorCount ${errorCount}`);
  const firestore = firebase.firestore();
  if (
    !(
      Number.isSafeInteger(errorCount) &&
      errorCount >= 0
    )
  ) {
    console.log('Invalid game information');
    throw new HttpsError('invalid-argument', 'Invalid game information');
  }
  return firestore.runTransaction(async (transaction): Promise<GameReward> => {
    const userRef = firestore
      .collection(FirebasePath.FIREBASE_PATH_USERS)
      .doc(userId);
    const userSnapshot = await transaction.get(userRef);
    if (!userSnapshot.exists) {
      console.log('Cannot retrieve user information');
      throw new HttpsError('unavailable', 'Cannot retrieve user information');
    }
    const user = userSnapshot.data() as User;
    const songRef = firestore.collection(FirebasePath.FIREBASE_PATH_SONGS).doc(songId);
    const songSnapshot = await transaction.get(songRef);
    if (!songSnapshot.exists) {
      console.log('Cannot retrieve played song information');
      throw new HttpsError(
        'unavailable',
        'Cannot retrieve played song information',
      );
    }
    const song: Song = songSnapshot.data() as Song;

    let stars = 0;
    const tilesCount = song.tilesCount[difficulty];
    const errorPercent = errorCount / tilesCount;
    if (errorPercent <= 0.05) {
      stars = 3;
    } else if (errorPercent <= 0.2) {
      stars = 2;
    } else {
      stars = 1;
    }

    user.playedNotes += tilesCount;
    user.stars += tilesCount - errorCount;
    user.playedTime += song.duration[speed];

    transaction.set(userRef, user);
    const reward: GameReward = {
      stars,
      playedNotes: tilesCount,
    };
    console.log(`Reward of the user is ${JSON.stringify(reward)}`);
    return reward;
  });
}
