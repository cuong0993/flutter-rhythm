// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['level'] as int,
    json['experience'] as int,
    json['maxLevelExperience'] as int,
    json['instrumentId'] as String,
    (json['notificationTokens'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'experience': instance.experience,
      'maxLevelExperience': instance.maxLevelExperience,
      'instrumentId': instance.instrumentId,
      'notificationTokens': instance.notificationTokens,
    };
