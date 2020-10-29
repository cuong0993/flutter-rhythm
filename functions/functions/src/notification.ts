import * as firebase from 'firebase-admin';
import { FirebasePath } from './firebase-path';
import { User } from './model/user';
import { Song } from './model/song';

export async function sendNewSongNotification(song: Song): Promise<any> {
  console.log(`New song ${song.id}, ${song.title}, ${song.artist}`);
  const tokens: string[] = [];
  const querySnapshot = await firebase
    .firestore()
    .collection(FirebasePath.FIREBASE_PATH_USERS).get();
  querySnapshot.forEach(async (doc): Promise<any> => {
    const user = <User>doc.data();
    if (user.notificationTokens !== null && user.notificationTokens !== undefined) {
      tokens.push(...user.notificationTokens);
    }
  });
  console.log('There are', tokens.length, 'tokens to send notifications to.');
  const payload = {
    notification: {
      title: 'New song available',
      body: `Tap to play ${song.title} - ${song.artist}`,
    },
  };
  return await firebase.messaging().sendToDevice(tokens, payload);
}
