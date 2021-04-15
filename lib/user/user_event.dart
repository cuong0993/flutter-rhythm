import 'package:built_value/built_value.dart';

import '../instrument/instrument.dart';
import 'user_repository.dart';

part 'user_event.g.dart';

abstract class UserEvent {}

abstract class UpdateUser
    implements Built<UpdateUser, UpdateUserBuilder>, UserEvent {
  factory UpdateUser([Function(UpdateUserBuilder) updates]) = _$UpdateUser;

  UpdateUser._();

  AppUser get user;

  List<Instrument> get instruments;
}

abstract class ChangeInstrument
    implements Built<ChangeInstrument, ChangeInstrumentBuilder>, UserEvent {
  factory ChangeInstrument([Function(ChangeInstrumentBuilder) updates]) =
      _$ChangeInstrument;

  ChangeInstrument._();

  String get instrumentId;
}
