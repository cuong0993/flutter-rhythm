import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String id;
  int playedNotes;
  int stars;
  Duration playedTime;
  String instrumentId;
  List<String> notificationTokens;

  User(
    this.id,
    this.playedNotes,
    this.playedTime,
    this.stars,
    this.instrumentId,
    this.notificationTokens,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
