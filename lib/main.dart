import 'package:flutter/material.dart';
import 'di/di.dart';
import 'package:talker/talker.dart';
import 'lab_project.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // Настраиваем DI

  FlutterError.onError = (details) {
    return getIt<Talker>().handle(details.exception, details.stack);
  };

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const AppName());
}
