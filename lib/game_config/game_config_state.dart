import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_config_state.freezed.dart';

@freezed
class GameConfigState with _$GameConfigState {
  factory GameConfigState({
    required int difficulty,
    required int speed,
  }) = _GameConfigState;
}
