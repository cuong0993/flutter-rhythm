import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  factory Note({
    required int note,
    required int startTick,
  }) = _Note;
}
