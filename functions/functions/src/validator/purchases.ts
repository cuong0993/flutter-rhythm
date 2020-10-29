import { NotificationType } from './notifications';

export interface Purchase {
  // Library-managed properties that represents a purchase made via Google Play Billing
  packageName: string;
  purchaseToken: string;
  sku: string;
  userId?: string; // userId of the user who made this purchase
  verifiedAt: number; // epoch timestamp of when the server last queried Play Developer API for this purchase
}

export interface OneTimeProductPurchase extends Purchase {
  purchaseTimeMillis: number;
  purchaseState: number;
  consumptionState: number;
  orderId: string;
  purchaseType?: number;
}

export interface SubscriptionPurchase extends Purchase {
  // Raw response from server
  // https://developers.google.com/android-publisher/api-ref/purchases/subscriptions/get
  startTimeMillis: number;
  expiryTimeMillis: number;
  autoRenewing: boolean;
  priceCurrencyCode: string;
  priceAmountMicros: number;
  countryCode: string;
  paymentState: number;
  cancelReason: number;
  userCancellationTimeMillis: number;
  orderId: string;
  linkedPurchaseToken: string;
  purchaseType?: number;

  // Library-managed Purchase properties
  replacedByAnotherPurchase: boolean;
  isMutable: boolean; // indicate if the subscription purchase details can be changed in the future (i.e. expiry date changed because of auto-renewal)
  latestNotificationType?: NotificationType; // store the latest notification type received via Realtime Developer Notification

  isRegisterable(): boolean;

  // These methods below are convenient utilities that developers can use to interpret Play Developer API response
  isEntitlementActive(): boolean;
  willRenew(): boolean;
  isTestPurchase(): boolean;
  isFreeTrial(): boolean;
  isGracePeriod(): boolean;
  isAccountHold(): boolean;
  activeUntilDate(): Date;
}

export enum SkuType {
  InApp = 'inapp',
  Subs = 'subs',
}
