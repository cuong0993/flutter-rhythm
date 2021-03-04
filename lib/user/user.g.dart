// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'playedNotes',
      serializers.serialize(object.playedNotes,
          specifiedType: const FullType(int)),
      'stars',
      serializers.serialize(object.stars, specifiedType: const FullType(int)),
      'playedTime',
      serializers.serialize(object.playedTime,
          specifiedType: const FullType(Duration)),
      'instrumentId',
      serializers.serialize(object.instrumentId,
          specifiedType: const FullType(String)),
      'notificationTokens',
      serializers.serialize(object.notificationTokens,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playedNotes':
          result.playedNotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'stars':
          result.stars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'playedTime':
          result.playedTime = serializers.deserialize(value,
              specifiedType: const FullType(Duration)) as Duration;
          break;
        case 'instrumentId':
          result.instrumentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notificationTokens':
          result.notificationTokens.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final int playedNotes;
  @override
  final int stars;
  @override
  final Duration playedTime;
  @override
  final String instrumentId;
  @override
  final BuiltList<String> notificationTokens;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {required this.id,
      required this.playedNotes,
      required this.stars,
      required this.playedTime,
      required this.instrumentId,
      required this.notificationTokens})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'User', 'id');
    BuiltValueNullFieldError.checkNotNull(playedNotes, 'User', 'playedNotes');
    BuiltValueNullFieldError.checkNotNull(stars, 'User', 'stars');
    BuiltValueNullFieldError.checkNotNull(playedTime, 'User', 'playedTime');
    BuiltValueNullFieldError.checkNotNull(instrumentId, 'User', 'instrumentId');
    BuiltValueNullFieldError.checkNotNull(
        notificationTokens, 'User', 'notificationTokens');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        playedNotes == other.playedNotes &&
        stars == other.stars &&
        playedTime == other.playedTime &&
        instrumentId == other.instrumentId &&
        notificationTokens == other.notificationTokens;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), playedNotes.hashCode),
                    stars.hashCode),
                playedTime.hashCode),
            instrumentId.hashCode),
        notificationTokens.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('playedNotes', playedNotes)
          ..add('stars', stars)
          ..add('playedTime', playedTime)
          ..add('instrumentId', instrumentId)
          ..add('notificationTokens', notificationTokens))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _playedNotes;
  int? get playedNotes => _$this._playedNotes;
  set playedNotes(int? playedNotes) => _$this._playedNotes = playedNotes;

  int? _stars;
  int? get stars => _$this._stars;
  set stars(int? stars) => _$this._stars = stars;

  Duration? _playedTime;
  Duration? get playedTime => _$this._playedTime;
  set playedTime(Duration? playedTime) => _$this._playedTime = playedTime;

  String? _instrumentId;
  String? get instrumentId => _$this._instrumentId;
  set instrumentId(String? instrumentId) => _$this._instrumentId = instrumentId;

  ListBuilder<String>? _notificationTokens;
  ListBuilder<String> get notificationTokens =>
      _$this._notificationTokens ??= new ListBuilder<String>();
  set notificationTokens(ListBuilder<String>? notificationTokens) =>
      _$this._notificationTokens = notificationTokens;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _playedNotes = $v.playedNotes;
      _stars = $v.stars;
      _playedTime = $v.playedTime;
      _instrumentId = $v.instrumentId;
      _notificationTokens = $v.notificationTokens.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'User', 'id'),
              playedNotes: BuiltValueNullFieldError.checkNotNull(
                  playedNotes, 'User', 'playedNotes'),
              stars:
                  BuiltValueNullFieldError.checkNotNull(stars, 'User', 'stars'),
              playedTime: BuiltValueNullFieldError.checkNotNull(
                  playedTime, 'User', 'playedTime'),
              instrumentId: BuiltValueNullFieldError.checkNotNull(
                  instrumentId, 'User', 'instrumentId'),
              notificationTokens: notificationTokens.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notificationTokens';
        notificationTokens.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
