// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    json['id'] as String,
    json['playedNotes'] as int,
    json['stars'] as int,
    Duration(microseconds: json['playedTime'] as int),
    json['instrumentId'] as String,
    json['name'] as String,
    json['photoUrl'] as String,
    json['anonymous'] as bool,
    const TimestampConverter().fromJson(json['creationTime'] as Timestamp),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'playedNotes': instance.playedNotes,
      'stars': instance.stars,
      'playedTime': instance.playedTime.inMicroseconds,
      'instrumentId': instance.instrumentId,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'anonymous': instance.anonymous,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
    };
