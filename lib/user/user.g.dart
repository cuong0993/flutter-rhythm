// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    playedNotes: json['playedNotes'] as int,
    stars: json['stars'] as int,
    playedTime: Duration(microseconds: json['playedTime'] as int),
    instrumentId: json['instrumentId'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
    anonymous: json['anonymous'] as bool,
    creationTime:
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
