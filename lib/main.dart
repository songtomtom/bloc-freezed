import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

// LoginScreen StatelessWidget
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => context
                        .read<LoginBloc>()
                        .add(LoginEvent.emailChanged(value)),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) => context
                        .read<LoginBloc>()
                        .add(LoginEvent.passwordChanged(value)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (!state.isLoading!) {
                        context
                            .read<LoginBloc>()
                            .add(const LoginEvent.loginSubmitted());
                      }
                    },
                    child: state.isLoading!
                        ? CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// main 함수
void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}
