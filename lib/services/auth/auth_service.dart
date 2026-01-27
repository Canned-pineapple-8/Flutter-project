import 'auth_service_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends AuthServiceInterface {
  // регистрация пользователя
  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      // создание пользователя через firebaseAuth (почта и пароль)
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message.toString(); // перехват ошибки
    }
  }

  // вход в аккаунт
  @override
  Future<void> logIn({required String email, required String password}) async {
    try {
      // вход через firebaseAuth (через почту и пароль)
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message.toString(); // перехват ошибки
    }
  }

  // выход из аккаунта
  @override
  Future<void> logOut() async {
    try {
      // выход из аккаунта через firebaseAuth
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message.toString(); // перехват ошибки
    }
  }
}
