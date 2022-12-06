part of 'id_cubit.dart';

class IdState extends Equatable {
  const IdState({this.currentId = ''});

  final String currentId;

  IdState copy({
    String? currentId,
  }) =>
      IdState(
        currentId: currentId ?? this.currentId,
      );

  @override
  List<Object> get props => [currentId];
}
