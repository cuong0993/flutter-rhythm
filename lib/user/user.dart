import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../timestamp_converter.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String id;
  String name;
  String photoUrl;
  String email;
  int level;
  int experience;
  int maxLevelExperience;
  String instrumentId;
  bool free;
  @TimestampConverter()
  DateTime premiumDueDate;
  @TimestampConverter()
  DateTime nextTimeReward;
  int coins;
  List<String> boughtSongs;
  List<String> notificationTokens;

  User(
    this.id,
    this.name,
    this.photoUrl,
    this.email,
    this.level,
    this.experience,
    this.maxLevelExperience,
    this.instrumentId,
    this.free,
    this.premiumDueDate,
    this.nextTimeReward,
    this.coins,
    this.boughtSongs,
    this.notificationTokens,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
