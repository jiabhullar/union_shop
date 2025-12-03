import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: ProductPage(
          product: Product(
        title: 'Test Product',
        price: '15.00',
        imageUrl: 'assets/images/test.jpg',
        tag: 'new',
        description: 'A test product description',
      )));
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('A test product description'), findsOneWidget);
    });

    testWidgets('should display  header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that header icons present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });
    
    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Placeholder Footer'), findsOneWidget);
      expect(
        find.text('Students should customise this footer section'),
        findsOneWidget,
      );
    });
  });
}
