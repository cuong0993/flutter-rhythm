import 'package:built_value/built_value.dart';
import 'user.dart';

part 'user_state.g.dart';

abstract class UserState {}

abstract class UserLoading
    implements Built<UserLoading, UserLoadingBuilder>, UserState {
  factory UserLoading([Function(UserLoadingBuilder) updates]) = _$UserLoading;

  UserLoading._();
}

abstract class UserUpdated
    implements Built<UserUpdated, UserUpdatedBuilder>, UserState {
  factory UserUpdated([Function(UserUpdatedBuilder) updates]) = _$UserUpdated;

  UserUpdated._();

  User get user;
}
