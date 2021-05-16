import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
// ignore: implementation_imports
import 'package:built_value/src/duration_serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'game/game_reward.dart';
import 'instrument/instrument.dart';
import 'songs/song.dart';
import 'timestamp_serializer_plugin.dart';
import 'user/user.dart';

part 'serializers.g.dart';

@SerializersFor([
  Instrument,
  Song,
  GameReward,
  User,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DurationSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(TimestampSerializerPlugin()))
    .build();
