import 'package:flutter/material.dart';
import '../../widgets/content_card.dart';
import '../../extensions/widget_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Пример данных для карточек
  final List<Map<String, String>> contentList = [
    {
      'image': 'assets/images/tigrash.jpg',
      'title': 'Tigrash',
      'description': 'Описание Тиграша 1',
    },
    {
      'image': 'assets/images/talik.png',
      'title': 'Talik',
      'description': 'Описание Талика 2',
    },
    {
      'image': 'assets/images/test_image.jpg',
      'title': 'Example',
      'description': 'Описание примера 3',
    },
    // можно добавить столько элементов, сколько нужно
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Header', style: Theme.of(context).textTheme.headlineLarge),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final content = contentList[index];
                return ContentCard(
                  imagePath: content['image']!,
                  title: content['title']!,
                  description: content['description']!,
                );
              },
              separatorBuilder: (_, __) => 16.ph,
            ),
          ],
        ),
      ),
    );
  }
}
