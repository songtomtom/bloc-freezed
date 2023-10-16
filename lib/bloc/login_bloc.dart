import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) {
      event.map(
        usernameChanged: (e) {
          // You might handle username changed event here if necessary
        },
        emailChanged: (e) {
          // Handle email changed
          emit(state.copyWith(email: e.email, errorMessage: null));
        },
        passwordChanged: (e) {
          // Handle password changed
          emit(state.copyWith(password: e.password, errorMessage: null));
        },
        loginSubmitted: (e) async {
          // Handle login submitted
          emit(state.copyWith(isLoading: true, errorMessage: null));

          // TODO: Add your login logic here
          // Simulate a network request by delaying for 2 seconds
          await Future.delayed(Duration(seconds: 2));

          // After the "network request", update the state
          if (state.email == 'test@example.com' &&
              state.password == 'password') {
            emit(state.copyWith(isLoading: false));
            // TODO: Navigate to the next screen or do something else
          } else {
            emit(state.copyWith(
                isLoading: false, errorMessage: 'Invalid email or password'));
          }
        },
      );
    });
  }
}
