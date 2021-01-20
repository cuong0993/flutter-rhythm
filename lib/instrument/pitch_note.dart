import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pitch_note.g.dart';

abstract class PitchNote implements Built<PitchNote, PitchNoteBuilder> {
  static Serializer<PitchNote> get serializer => _$pitchNoteSerializer;

  factory PitchNote([Function(PitchNoteBuilder) updates]) = _$PitchNote;

  PitchNote._();

  int get note;

  double get pitch;
}
