import * as firebase from 'firebase-admin';
import { onUserSignUp } from '../user/user';
import { EventContext } from 'firebase-functions';

firebase.initializeApp();
const userRecord1: any = { uid: 'TestUser1', providerData: [], displayName: 'TestUser1', email: 'TestUser1@email.com' };
const userRecord2: any = { uid: 'TestUser2', providerData: [], displayName: 'TestUser2', email: 'TestUser2@email.com' };
onUserSignUp(userRecord1, {} as EventContext);
onUserSignUp(userRecord2, {} as EventContext);
