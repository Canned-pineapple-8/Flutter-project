import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath; // путь к изображению, которое нужно показать
  final String title; // заголовок элемента
  final String description; // описание элемента

  const DetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // строка заголовка верхней панели
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath), // показываем картинку
            SizedBox(height: 16), // отступ после картинки
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge, // используем тему
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8), // отступ после заголовка
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium, // описание
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
