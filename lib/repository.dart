import 'dart:async';
import 'dart:math';

import 'model.dart';

class Repository {
  Repository() {
    _modelController = StreamController<Model>(
      onListen: () {
        startTimer();
      },
      onResume: () {
        startTimer();
      },
      onCancel: () {
        stopTimer();
      },
      onPause: () {
        stopTimer();
      },
    );
  }

  stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _add(timer.tick),
    );
  }

  void _add(int tick) {
    _modelController.add(Model(
      id: tick.toString(),
      number: tick,
      random: Random().nextInt(1000),
    ));
  }

  Timer? _timer;
  late StreamController<Model> _modelController;
  Stream<Model>? _models;
  Stream<Model> get models =>
      _models ??= _modelController.stream.asBroadcastStream();

  Stream<String> get ids => models.map((event) => event.id);
  Stream<int> get numbers => models.map((event) => event.number);
  Stream<int> get random => models.map((event) => event.random);
}
