// Possible errors when attempt to query a purchase using Play Developer API and purchase records stored in Firestore
export enum PurchaseQueryError {
  InvalidToken = 'InvalidToken',
  OtherError = 'OtherError',
}

// Possible errors when attempt to register / transfer a purchase to an user
export enum PurchaseUpdateError {
  InvalidToken = 'InvalidToken',
  Conflict = 'Conflict', // happens when attempt to register a purchase that has been registered before
  OtherError = 'OtherError',
}
