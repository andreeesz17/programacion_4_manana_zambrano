// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:modulo08_material3/main.dart';

void main() {
  testWidgets('Smoke test AppMonitoreo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AppMonitoreo());

    // Verify that the title 'SnackBar y Dialog' is present in Paso 6.
    expect(find.text('SnackBar y Dialog'), findsOneWidget);
  });
}
