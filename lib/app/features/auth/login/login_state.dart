import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

// экран открыт
class LoginInitial extends LoginState {
  const LoginInitial();
}

// идёт авторизация
class LoginLoading extends LoginState {
  const LoginLoading();
}

// успешный вход
class LoginSuccess extends LoginState {
  const LoginSuccess();
}

// ошибка входа
class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object?> get props => [message];
}
