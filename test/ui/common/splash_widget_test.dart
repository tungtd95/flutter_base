import 'package:flutter/material.dart';
import 'package:flutter_base/ui/common/splash_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashWidget()));
    expect(find.byType(IconButton), findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(find.byType(IconButton), findsNothing);
  });
}
