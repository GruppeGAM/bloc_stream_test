import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model.dart';
import '../repository.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  ModelBloc({
    required this.repository,
  }) : super(const ModelState()) {
    on<Listen>((event, emit) async {
      await emit.forEach(
        repository.models,
        onData: (data) => state.copy(
          models: [
            ...state.models,
            data,
          ],
        ),
      );
    });
  }

  final Repository repository;
}
