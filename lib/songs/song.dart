import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'song.g.dart';

abstract class Song implements Built<Song, SongBuilder> {
  static Serializer<Song> get serializer => _$songSerializer;

  factory Song([Function(SongBuilder b) updates]) = _$Song;

  Song._();

  String get id;

  String get title;

  String get artist;

  String get url;

  int get bpm;

  int get unitDuration;

  BuiltList<int> get tilesCount;

  BuiltList<int> get duration;

  BuiltList<String> get tags;
}
