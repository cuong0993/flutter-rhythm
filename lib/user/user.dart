import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../timestamp_converter.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String id;
  int level;
  int experience;
  int maxLevelExperience;
  String instrumentId;
  List<String> notificationTokens;

  User(
    this.id,
    this.level,
    this.experience,
    this.maxLevelExperience,
    this.instrumentId,
    this.notificationTokens,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
