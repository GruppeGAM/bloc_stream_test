import 'package:bloc/bloc.dart';
import 'package:bloc_stream_test/repository.dart';
import 'package:equatable/equatable.dart';

part 'id_state.dart';

class IdCubit extends Cubit<IdState> {
  IdCubit({required this.repository}) : super(const IdState());

  final Repository repository;

  load() =>
      repository.ids.listen((event) => emit(state.copy(currentId: event)));
}
