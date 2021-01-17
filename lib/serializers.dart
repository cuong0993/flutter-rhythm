import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
// ignore: implementation_imports
import 'package:built_value/src/duration_serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'game/game_reward.dart';
import 'instrument/instrument.dart';
import 'instrument/pitch_note.dart';
import 'songs/song.dart';
import 'user/user.dart';

part 'serializers.g.dart';

//add all of the built value types that require serialization
@SerializersFor([
  Instrument,
  Song,
  GameReward,
  PitchNote,
  User,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DurationSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
