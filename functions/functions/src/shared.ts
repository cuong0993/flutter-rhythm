import * as functions from 'firebase-functions';
import { CallableContext } from 'firebase-functions/lib/providers/https';

export function getUserId(context: CallableContext): string {
  if (!context.auth) {
    console.log('Unauthorized Access');
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Unauthorized Access',
    );
  } else {
    return context.auth.uid;
  }
}
