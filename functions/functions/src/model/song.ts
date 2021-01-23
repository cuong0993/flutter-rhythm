export interface Song {
  id: string;
  title: string;
  artist: string;
  url: string;
  bpm: number;
  unitDuration: number;
  tilesCount: number[];
  duration: number[];
}
