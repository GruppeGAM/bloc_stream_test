part of 'number_cubit.dart';

class NumberState extends Equatable {
  const NumberState({this.currentNumber = ''});

  final String currentNumber;

  NumberState copy({
    String? currentNumber,
  }) =>
      NumberState(
        currentNumber: currentNumber ?? this.currentNumber,
      );

  @override
  List<Object> get props => [currentNumber];
}
