// As defined in https://developer.android.com/google/play/billing/realtime_developer_notifications.html#json_specification
export interface DeveloperNotification {
  version: string;
  packageName: string;
  eventTimeMillis: number;
  subscriptionNotification?: SubscriptionNotification;
  testNotification?: TestNotification;
}

// As defined in https://developer.android.com/google/play/billing/realtime_developer_notifications.html#json_specification
export interface SubscriptionNotification {
  version: string;
  notificationType: NotificationType;
  purchaseToken: string;
  subscriptionId: string;
}

// As defined in https://developer.android.com/google/play/billing/realtime_developer_notifications.html#json_specification
export interface TestNotification {
  version: string;
}

// As defined in https://developer.android.com/google/play/billing/realtime_developer_notifications.html#notification_types
export enum NotificationType {
    SUBSCRIPTION_PURCHASED = 4,
    SUBSCRIPTION_RENEWED = 2,
    SUBSCRIPTION_RECOVERED = 1,
    SUBSCRIPTION_CANCELED = 3,
    SUBSCRIPTION_ON_HOLD = 5,
    SUBSCRIPTION_IN_GRACE_PERIOD = 6,
    SUBSCRIPTION_RESTARTED = 7,
}
