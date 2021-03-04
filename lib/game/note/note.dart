import 'package:built_value/built_value.dart';

part 'note.g.dart';

abstract class Note implements Built<Note, NoteBuilder> {
  factory Note([Function(NoteBuilder) updates]) = _$Note;

  Note._();

  int get note;

  int get startTick;
}
