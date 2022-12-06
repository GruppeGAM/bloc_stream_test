part of 'model_bloc.dart';

class ModelState extends Equatable {
  const ModelState({this.models = const []});

  final List<Model> models;

  ModelState copy({List<Model>? models}) =>
      ModelState(models: models ?? this.models);

  @override
  List<Object> get props => [models];
}
