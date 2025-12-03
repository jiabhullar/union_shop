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

      testWidgets('should display dropdown for size', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.byType(DropdownButton<String>), findsOneWidget);

      testWidgets('should display quantity selector and buttons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.text('1'), findsOneWidget); 
      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.text('Personalise'), findsOneWidget);
      });
    });
  });
}
