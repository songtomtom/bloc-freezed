import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        emailChanged: (e) async {
          emit(state.copyWith(email: e.email, errorMessage: null));
        },
        passwordChanged: (e) async {
          emit(state.copyWith(password: e.password, errorMessage: null));
        },
        loginSubmitted: (e) async {
          emit(state.copyWith(isLoading: true, errorMessage: null));
          try {
            // TODO: 비동기 로그인 로직
            await Future.delayed(
                Duration(seconds: 2)); // await를 사용하여 비동기 연산을 기다립니다.

            // 예시: 하드코딩된 이메일과 비밀번호 비교
            if (state.email == 'test@example.com' &&
                state.password == 'password') {
              emit(state.copyWith(isLoading: false));
              // TODO: 로그인이 성공적으로 완료된 후의 로직 (예: 다음 페이지로 이동)
            } else {
              emit(state.copyWith(
                  isLoading: false, errorMessage: 'Invalid email or password'));
            }

            emit(state.copyWith(isLoading: false));
          } catch (error) {
            emit(state.copyWith(
                isLoading: false,
                errorMessage: 'An error occurred while logging in'));
          }
        },
      );
    });
  }
}
