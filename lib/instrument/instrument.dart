import 'package:freezed_annotation/freezed_annotation.dart';

part 'instrument.freezed.dart';
part 'instrument.g.dart';

@freezed
class Instrument with _$Instrument {
  factory Instrument(
    String id,
    Map<int, String> soundPaths,
    Map<int, int> baseNotes,
    int minNote,
    int maxNote,
  ) = _Instrument;

  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
}
