import * as functions from 'firebase-functions';
import * as firebase from 'firebase-admin';
import { onUserSignUp, onUserDeleted } from './user/user';
import { getGameReward } from './game/game-manager';

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

// TODO
// if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'verifyPurchase') {
//   exports.verifyPurchase = functions.runWith(runtimeOpts).https.onCall(async (data: any, context: CallableContext): Promise<any> => {
//     await verifyPurchase(data, context, functions.config().app.package);
//   });
// }

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'getGameReward') {
  exports.getGameReward = functions.runWith(runtimeOpts).https.onCall(getGameReward);
}

// TODO
// if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'checkIfExpiredSubscriptionsRenewed') {
//   exports.checkIfExpiredSubscriptionsRenewed = functions.runWith(runtimeOpts).pubsub.schedule(functions.config().app.check_expired_subscription_interval).timeZone('Asia/Saigon').onRun(checkIfExpiredSubscriptionsRenewed);
// }

// TODO
// if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'sendNewSongNotification') {
//   exports.sendNewSongNotification = functions.runWith(runtimeOpts).firestore.document(`${FirebasePath.FIREBASE_PATH_SONGS}/{songId}`).onCreate((snap, _): Promise<any> => {
//     const song = snap.data() as Song;
//     return sendNewSongNotification(song);
//   });
// }
