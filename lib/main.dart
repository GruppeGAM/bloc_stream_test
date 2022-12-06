import 'package:bloc_stream_test/cubit/id_cubit.dart';
import 'package:bloc_stream_test/cubit/number_cubit.dart';
import 'package:bloc_stream_test/cubit/random_cubit.dart';
import 'package:bloc_stream_test/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/model_bloc.dart';
import 'model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          BlocProvider<IdCubit>.value(
              value: IdCubit(repository: repository)..load()),
          BlocProvider<NumberCubit>.value(
              value: NumberCubit(repository: repository)..load()),
          BlocProvider<RandomCubit>.value(
              value: RandomCubit(repository: repository)..load()),
        ],
        child: const MyAppPage(),
      ),
    );
  }

  @override
  void dispose() {
    repository.stopTimer();
    super.dispose();
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<IdCubit, IdState>(
            builder: (context, state) => Text('Current ID: ${state.currentId}'),
          ),
          BlocBuilder<NumberCubit, NumberState>(
            builder: (context, state) =>
                Text('Current Number: ${state.currentNumber}'),
          ),
          BlocBuilder<RandomCubit, RandomState>(
            builder: (context, state) =>
                Text('Current Random: ${state.currentRandom}'),
          ),
          ListView(
            shrinkWrap: true,
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
        ],
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

class IdWidget extends StatelessWidget {
  const IdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
