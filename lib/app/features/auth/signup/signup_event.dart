import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

// запрос на регистрацию: отправляется по нажатию кнопки "Зарегистрироваться"
// содержит почту и пароль, отправляется из UI в BLoC
class SignUpRequested extends SignUpEvent {
  final String email;
  final String password;

  const SignUpRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
