import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository.dart';

part 'random_state.dart';

class RandomCubit extends Cubit<RandomState> {
  RandomCubit({required this.repository}) : super(const RandomState());

  final Repository repository;

  load() => repository.random
      .listen((event) => emit(state.copy(currentRandom: event.toString())));
}
