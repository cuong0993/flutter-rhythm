import * as firebase from 'firebase-admin';
import { checkIfExpiredSubscriptionsRenewed } from '../validator/validator';

firebase.initializeApp();
checkIfExpiredSubscriptionsRenewed();
