// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_reward.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GameReward> _$gameRewardSerializer = new _$GameRewardSerializer();

class _$GameRewardSerializer implements StructuredSerializer<GameReward> {
  @override
  final Iterable<Type> types = const [GameReward, _$GameReward];
  @override
  final String wireName = 'GameReward';

  @override
  Iterable<Object?> serialize(Serializers serializers, GameReward object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
      'playedNotes',
      serializers.serialize(object.playedNotes,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GameReward deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GameRewardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'playedNotes':
          result.playedNotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GameReward extends GameReward {
  @override
  final int stars;
  @override
  final int playedNotes;

  factory _$GameReward([void Function(GameRewardBuilder)? updates]) =>
      (new GameRewardBuilder()..update(updates)).build();

  _$GameReward._({required this.stars, required this.playedNotes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(stars, 'GameReward', 'stars');
    BuiltValueNullFieldError.checkNotNull(
        playedNotes, 'GameReward', 'playedNotes');
  }

  @override
  GameReward rebuild(void Function(GameRewardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameRewardBuilder toBuilder() => new GameRewardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameReward &&
        stars == other.stars &&
        playedNotes == other.playedNotes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, stars.hashCode), playedNotes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameReward')
          ..add('stars', stars)
          ..add('playedNotes', playedNotes))
        .toString();
  }
}

class GameRewardBuilder implements Builder<GameReward, GameRewardBuilder> {
  _$GameReward? _$v;

  int? _stars;
  int? get stars => _$this._stars;
  set stars(int? stars) => _$this._stars = stars;

  int? _playedNotes;
  int? get playedNotes => _$this._playedNotes;
  set playedNotes(int? playedNotes) => _$this._playedNotes = playedNotes;

  GameRewardBuilder();

  GameRewardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stars = $v.stars;
      _playedNotes = $v.playedNotes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameReward other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameReward;
  }

  @override
  void update(void Function(GameRewardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameReward build() {
    final _$result = _$v ??
        new _$GameReward._(
            stars: BuiltValueNullFieldError.checkNotNull(
                stars, 'GameReward', 'stars'),
            playedNotes: BuiltValueNullFieldError.checkNotNull(
                playedNotes, 'GameReward', 'playedNotes'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
