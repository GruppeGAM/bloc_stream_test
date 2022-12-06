part of 'random_cubit.dart';

class RandomState extends Equatable {
  const RandomState({this.currentRandom = ''});

  final String currentRandom;

  RandomState copy({
    String? currentRandom,
  }) =>
      RandomState(
        currentRandom: currentRandom ?? this.currentRandom,
      );

  @override
  List<Object> get props => [currentRandom];
}
