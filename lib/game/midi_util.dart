const NUMBER_OF_NOTES = 128;
const MINUTE_TO_SECOND = 60;

double tickToSecond1(int resolution, int bpm) {
  return MINUTE_TO_SECOND.toDouble() / (resolution * bpm);
}
