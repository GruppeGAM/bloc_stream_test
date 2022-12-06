import 'package:equatable/equatable.dart';

class Model extends Equatable {
  const Model({required this.id, required this.number, required this.random});
  final String id;
  final int number;
  final int random;

  @override
  List<Object?> get props => [id, number, random];
}
