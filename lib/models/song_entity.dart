import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SongEntity extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  const SongEntity(this.task, this.id, this.note, this.complete);

  Map<String, Object> toJson() {
    return {
      "complete": complete,
      "task": task,
      "note": note,
      "id": id,
    };
  }

  @override
  List<Object> get props => [complete, id, note, task];

  @override
  String toString() {
    return 'SongEntity { complete: $complete, task: $task, note: $note, id: $id }';
  }

  static SongEntity fromJson(Map<String, Object> json) {
    return SongEntity(
      json["task"] as String,
      json["id"] as String,
      json["note"] as String,
      json["complete"] as bool,
    );
  }

  static SongEntity fromSnapshot(DocumentSnapshot snap) {
    return SongEntity(
      snap.data()['task'],
      snap.id,
      snap.data()['note'],
      snap.data()['complete'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "complete": complete,
      "task": task,
      "note": note,
    };
  }
}
