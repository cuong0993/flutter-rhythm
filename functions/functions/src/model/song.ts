export interface Song {
  id: string;
  title: string;
  artist: string;
  url: string;
  imageUrl: string;
  bpm: number;
  tilesCount: number[];
  duration: number[];
}
