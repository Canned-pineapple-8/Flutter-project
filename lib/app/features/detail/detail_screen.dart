import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di/di.dart';
import 'bloc/detail_bloc.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final DetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<DetailBloc>();
    _bloc.add(DetailLoad(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: BlocBuilder<DetailBloc, DetailState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is DetailLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DetailLoadFailure) {
            return Center(child: Text("Ошибка: ${state.error}"));
          }

          if (state is DetailLoadSuccess) {
            final content = state.content;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    content.image,
                    height: 500,
                    width: 500,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    content.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    content.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
