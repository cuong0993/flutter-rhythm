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
import { maxLevelExperiences } from '../user/user';

export async function getGameReward(
  data: any,
  context: CallableContext,
): Promise<GameReward> {
  const errorCount = <number>data.errorCount;
  const songId = <string>data.songId;

  const userId = getUserId(context);
  console.log(`User ${userId} is getting game reward with songId ${songId}, errorCount ${errorCount}`);
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
    const tilesCount = song.tilesCount;
    const errorPercent = errorCount / tilesCount;
    const baseExperiences = tilesCount;
    let experiences = 0;
    if (errorPercent <= 0.05) {
      stars = 3;
      experiences = baseExperiences;
    } else if (errorPercent <= 0.2) {
      stars = 2;
      experiences = Math.floor(0.7 * baseExperiences);
    } else {
      stars = 1;
      experiences = Math.floor(0.5 * baseExperiences);
    }

    const newExperience = user.experience + experiences;
    if (newExperience >= maxLevelExperiences[user.level]) {
      // Bravo, up level
      user.experience = newExperience - maxLevelExperiences[user.level];
      user.level += 1;
      user.maxLevelExperience = maxLevelExperiences[user.level];
    } else {
      user.experience = newExperience;
    }
    transaction.set(userRef, user);
    const reward: GameReward = {
      stars,
      experiences,
    };
    console.log(`Reward of the user is ${JSON.stringify(reward)}`);
    return reward;
  });
}
