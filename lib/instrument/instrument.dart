import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'pitch_note.dart';

part 'instrument.g.dart';

abstract class Instrument implements Built<Instrument, InstrumentBuilder> {
  static Serializer<Instrument> get serializer => _$instrumentSerializer;

  factory Instrument([Function(InstrumentBuilder) updates]) = _$Instrument;

  Instrument._();

  String get id;

  BuiltMap<int, String> get soundFiles;

  BuiltMap<int, PitchNote> get soundNotes;

  int get minNote;

  int get maxNote;

  double get volume;
}
