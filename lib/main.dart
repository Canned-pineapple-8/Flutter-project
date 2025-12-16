import 'package:flutter/material.dart';
import 'di/di.dart';
import 'package:talker/talker.dart';
import 'lab_project.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // Настраиваем DI

  FlutterError.onError = (details) {
    return getIt<Talker>().handle(details.exception, details.stack);
  };

  runApp(const AppName());
}
