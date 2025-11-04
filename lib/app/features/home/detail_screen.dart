import 'package:flutter/material.dart';
import '../../extensions/widget_extensions.dart';

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
        title: Text(title), // заголовок
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              // изображение фиксированного размера (500 на 500 пикселей)
              imagePath,
              height: 500,
              width: 500,
              fit: BoxFit.cover,
            ),
            16.ph, // виджет-заполнитель после картинки
            Text(
              // текстовое поле с заголовком
              title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            16.ph, // виджет-заполнитель после заголовка
            Text(
              // текстовое поле с описанием
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
