// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['name'] as String,
    json['photoUrl'] as String,
    json['email'] as String,
    json['level'] as int,
    json['experience'] as int,
    json['maxLevelExperience'] as int,
    json['instrumentId'] as String,
    json['free'] as bool,
    const TimestampConverter().fromJson(json['premiumDueDate'] as Timestamp),
    const TimestampConverter().fromJson(json['nextTimeReward'] as Timestamp),
    json['coins'] as int,
    (json['boughtSongs'] as List)?.map((e) => e as String)?.toList(),
    (json['notificationTokens'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'email': instance.email,
      'level': instance.level,
      'experience': instance.experience,
      'maxLevelExperience': instance.maxLevelExperience,
      'instrumentId': instance.instrumentId,
      'free': instance.free,
      'premiumDueDate':
          const TimestampConverter().toJson(instance.premiumDueDate),
      'nextTimeReward':
          const TimestampConverter().toJson(instance.nextTimeReward),
      'coins': instance.coins,
      'boughtSongs': instance.boughtSongs,
      'notificationTokens': instance.notificationTokens,
    };
