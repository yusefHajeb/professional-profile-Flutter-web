import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:professional_profile/presentation/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
