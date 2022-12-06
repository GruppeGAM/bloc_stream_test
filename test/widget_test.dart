import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_stream_test/main.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MyApp());
  });
}
