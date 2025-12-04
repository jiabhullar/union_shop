import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/product.dart';

void main() {
  testWidgets('CartPage displays empty message and items when present', (tester) async {
    // Ensure cart empty state renders
    CartService.instance.clearCart();
    await tester.pumpWidget(const MaterialApp(home: CartPage()));
    await tester.pumpAndSettle();

    expect(find.text('Your cart is empty'), findsOneWidget);

        
    final product = Product(
      title: 'CartTest',
      price: '5.00',
      imageUrl: 'assets/images/test.jpg',
      tag: 'all',
      description: 'desc',

    );

    CartService.instance.addToCart(product, quantity: 2, size: 'M');

    await tester.pumpWidget(const MaterialApp(home: CartPage()));
    await tester.pumpAndSettle();

    expect(find.text('CartTest'), findsOneWidget);
    expect(find.text('Total:'), findsOneWidget);
  });
}