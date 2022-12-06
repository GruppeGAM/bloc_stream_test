import 'package:bloc_stream_test/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/model_bloc.dart';
import 'model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ModelBloc>.value(
            value: ModelBloc(repository: repository)..add(Listen()),
          ),
        ],
        child: const MyAppPage(),
      ),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            BlocBuilder<ModelBloc, ModelState>(
              builder: (context, state) => Column(
                children: [
                  ...state.models.map(
                    (e) => ModelWidget(model: e),
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

class ModelWidget extends StatelessWidget {
  const ModelWidget({super.key, required this.model});

  final Model model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Id: ${model.id} '),
        Text('Number: ${model.number} '),
        Text('Random: ${model.random} '),
      ],
    );
  }
}
