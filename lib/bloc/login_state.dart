part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    String? email,
    String? password,
    String? errorMessage,
    bool? isLoading,
  }) = _LoginState;
  factory LoginState.initial() => const LoginState(isLoading: false);
}
