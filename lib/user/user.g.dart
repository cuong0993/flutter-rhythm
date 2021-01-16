// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['playedNotes'] as int,
    json['playedTime'] == null
        ? null
        : Duration(microseconds: json['playedTime'] as int),
    json['stars'] as int,
    json['instrumentId'] as String,
    (json['notificationTokens'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'playedNotes': instance.playedNotes,
      'stars': instance.stars,
      'playedTime': instance.playedTime?.inMicroseconds,
      'instrumentId': instance.instrumentId,
      'notificationTokens': instance.notificationTokens,
    };
