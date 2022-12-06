import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit({required this.repository}) : super(const NumberState());

  final Repository repository;

  load() => repository.numbers
      .listen((event) => emit(state.copy(currentNumber: event.toString())));
}
