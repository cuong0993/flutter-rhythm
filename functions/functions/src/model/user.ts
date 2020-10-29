
export interface User {
  id: string;
  level: number;
  experience: number;
  maxLevelExperience: number;
  instrumentId: string;
  free: boolean;
  premiumDueDate: Date;
  nextTimeReward: Date;
  coins: number;
  boughtSongs: string[];
  notificationTokens: string[];
}
