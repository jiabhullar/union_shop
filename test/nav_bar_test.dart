import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Navigation Tests', () {
    testWidgets('should navigate to About page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final aboutButton = find.text('ABOUT US');
      expect(aboutButton, findsOneWidget);

      await tester.tap(aboutButton);
      await tester.pumpAndSettle();

      expect(find.text('About Us'), findsOneWidget);
    });
  });
}