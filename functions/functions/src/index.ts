import * as functions from 'firebase-functions';
import * as firebase from 'firebase-admin';
import { verifyPurchase, checkIfExpiredSubscriptionsRenewed } from './validator/validator';
import { onUserSignUp, onUserDeleted } from './user/user';
import { CallableContext } from 'firebase-functions/lib/providers/https';
import { takeReward } from './reward/reward';
import { FirebasePath } from './firebase-path';
import { sendNewSongNotification } from './notification';
import { getGameReward, unlockSong } from './game/game-manager';
import { Song } from './model/song';

const runtimeOpts: functions.RuntimeOptions = {
  timeoutSeconds: 540,
  memory: '128MB',
};
firebase.initializeApp();

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'onUserSignUp') {
  exports.onUserSignUp = functions.runWith(runtimeOpts).auth
    .user()
    .onCreate(onUserSignUp);
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'onUserDeleted') {
  exports.onUserDeleted = functions.runWith(runtimeOpts).auth
    .user()
    .onDelete(onUserDeleted);
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'verifyPurchase') {
  exports.verifyPurchase = functions.runWith(runtimeOpts).https.onCall(async (data: any, context: CallableContext): Promise<any> => {
    await verifyPurchase(data, context, functions.config().app.package);
  });
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'takeReward') {
  exports.takeReward = functions.runWith(runtimeOpts).https.onCall(takeReward);
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'getGameReward') {
  exports.getGameReward = functions.runWith(runtimeOpts).https.onCall(getGameReward);
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'unlockSong') {
  exports.unlockSong = functions.runWith(runtimeOpts).https.onCall(unlockSong);
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'checkIfExpiredSubscriptionsRenewed') {
  exports.checkIfExpiredSubscriptionsRenewed = functions.runWith(runtimeOpts).pubsub.schedule(functions.config().app.check_expired_subscription_interval).timeZone('Asia/Saigon').onRun(checkIfExpiredSubscriptionsRenewed);
}

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'sendNewSongNotification') {
  exports.sendNewSongNotification = functions.runWith(runtimeOpts).firestore.document(`${FirebasePath.FIREBASE_PATH_SONGS}/{songId}`).onCreate((snap, _): Promise<any> => {
    const song = snap.data() as Song;
    return sendNewSongNotification(song);
  });
}
