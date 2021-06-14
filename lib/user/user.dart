import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../timestamp_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required int playedNotes,
    required int stars,
    required Duration playedTime,
    required String instrumentId,
    required String name,
    required String photoUrl,
    required bool anonymous,
    @TimestampConverter() required DateTime creationTime,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
