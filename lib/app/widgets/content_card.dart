import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app.dart'; // Для расширений ph/pw

class ContentCard extends StatelessWidget {
  final String imagePath; // путь к изображению
  final String title; // заголовок
  final String description; // описание

  const ContentCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = 100.0;

    return InkWell(
      onTap: () {
        // При нажатии открываем DetailScreen, передавая данные карточки
        context.push(
          '/detail',
          extra: {
            'image': imagePath,
            'title': title,
            'description': description,
          },
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: imageSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath, // теперь используем путь из параметра
                height: imageSize,
                width: imageSize,
                fit: BoxFit.cover,
              ),
            ),
            16.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // используем параметр title
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  4.ph,
                  Expanded(
                    child: Text(
                      description, // используем параметр description
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
