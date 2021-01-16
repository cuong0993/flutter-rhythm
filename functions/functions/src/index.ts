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

if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === 'getGameReward') {
  exports.getGameReward = functions.runWith(runtimeOpts).https.onCall(getGameReward);
}
