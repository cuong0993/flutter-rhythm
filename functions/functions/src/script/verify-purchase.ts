import * as firebase from 'firebase-admin';
import { verifyPurchase } from '../validator/validator';
import { CallableContext } from 'firebase-functions/lib/providers/https';

firebase.initializeApp();
const purchase: any = { sku: '1_week', token: 'ffhkgbfgclaonlhpbhelggmm.AO-J1OyULiLOpshvlevDoOVBxDiwmEPIGYRPvjRVDwztnyQu34Nd_EvdDUMZoWaqsLsW-tMFDcI5BCTnFJ7kw1VMYSi2VvB68D2_tsej94VD0MpvhFa5Aq_XulmVnk2VAeDNLEhcoGcw', isSubscription: true };
verifyPurchase(purchase, { auth: { uid: 'TestUser1' } } as CallableContext, 'com.chaomao.lalaorchestra');
