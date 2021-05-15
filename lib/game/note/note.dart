import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  factory Note(
    int note,
    int startTick,
  ) = _Note;
}
