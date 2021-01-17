import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  factory User([Function(UserBuilder b) updates]) = _$User;

  User._();

  String get id;

  int get playedNotes;

  int get stars;

  Duration get playedTime;

  String get instrumentId;

  BuiltList<String> get notificationTokens;
}
