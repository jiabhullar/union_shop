import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return MaterialApp(home: ProductPage(product: Product(
        title: 'Sample Product',
        price: '15.00',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
        onSale: false,
        tag: 'new',
        description: 'This is a sample product',
      )));
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that basic UI elements are present
      expect(
        find.text('PLACEHOLDER HEADER TEXT - STUDENTS TO UPDATE!'),
        findsOneWidget,
      );
      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should display student instruction text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that student instruction is present
      expect(
        find.text(
          'Students should add size options, colour options, quantity selector, add to cart button, and buy now button here.',
        ),
        findsOneWidget,
      );
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
