// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_shop_app/main.dart';
import 'package:flutter_shop_app/core/config/app_config.dart';

void main() {
  testWidgets('Verification screen smoke test', (WidgetTester tester) async {
    // Load dotenv mock data for the test environment.
    dotenv.testLoad(fileInput: 'API_BASE_URL=https://higuera-shopapi.uaeftt-ute.site/api');

    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterShopApp());

    // Verify that our app name is displayed.
    expect(find.text(AppConfig.appName), findsOneWidget);
  });
}
