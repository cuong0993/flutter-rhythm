import 'package:freezed_annotation/freezed_annotation.dart';

part 'instrument.freezed.dart';
part 'instrument.g.dart';

@freezed
class Instrument with _$Instrument {
  factory Instrument({
    required String id,
    required Map<int, String> soundPaths,
    required Map<int, int> baseNotes,
    required int minNote,
    required int maxNote,
  }) = _Instrument;

  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
}
