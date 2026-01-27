import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

// запрос на авторизацию (по нажатию кнопки)
class LoginRequested extends LoginEvent {
  final String email; // почта
  final String password; // пароль

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
