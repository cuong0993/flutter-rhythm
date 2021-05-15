import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../timestamp_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User(
    String id,
    int playedNotes,
    int stars,
    Duration playedTime,
    String instrumentId,
    String name,
    String photoUrl,
    bool anonymous,
    @TimestampConverter() DateTime creationTime,
  ) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
