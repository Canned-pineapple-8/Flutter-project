import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // контроллеры почты и пароля
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // при нажатии кнопки
  void _onLoginPressed() {
    context.read<LoginBloc>().add(
      LoginRequested(
        // убираем лишние пробелы
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // при успешной авторизации переходим на домашнюю страницу
            context.go('/home');
          }

          // иначе отображаем ошибку
          if (state is LoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }

                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onLoginPressed,
                      child: const Text('Войти'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // кнопка перехода к регистрации
              TextButton(
                onPressed: () {
                  context.go('/signup');
                },
                child: const Text('Нет аккаунта? Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
