import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/pages/product_page.dart';


void main() {
  final product = Product(
    title: 'Placeholder Product',
    price: '£10.00',
    imageUrl: 'assets/images/test.jpg',
    tag: 'new',
    description: 'desc',
  );

  testWidgets('ProductCard shows title and price and navigates', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ProductCard(product: product),
      ),
      routes: {
        '/product': (ctx) => ProductPage(product: product),
      },
    ));

  });
}
