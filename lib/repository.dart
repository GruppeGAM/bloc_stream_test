import 'dart:async';
import 'dart:math';

import 'model.dart';

class Repository {
  Repository() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _modelController.sink.add(Model(
          id: timer.tick.toString(),
          number: timer.tick,
          random: Random().nextInt(1000))),
    );
  }

  final StreamController<Model> _modelController = StreamController<Model>();
  Stream<Model> get models => _modelController.stream.asBroadcastStream();
  Stream<String> get ids => models.map((event) => event.id).asBroadcastStream();
  Stream<int> get numbers =>
      models.map((event) => event.number).asBroadcastStream();
  Stream<int> get random =>
      models.map((event) => event.random).asBroadcastStream();
}
