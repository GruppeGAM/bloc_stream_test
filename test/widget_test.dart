import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_stream_test/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  testWidgets('smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
  });
}
