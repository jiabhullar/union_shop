import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';

void main() {
  group('CartService', () {
    final product = Product(
      title: 'Test Product',
      price: '10.00',
      imageUrl: 'assets/images/test.jpg',
      tag: 'new',
      description: 'A test product',
    );
    test('cart is initially empty', () {
      CartService.instance.clearCart();
      expect(CartService.instance.items.length, 0);
    });
    test('addToCart adds a product', () {
      CartService.instance.clearCart();
      CartService.instance.addToCart(product, quantity: 2, size: 'M');
      expect(CartService.instance.items.length, 1);
      expect(CartService.instance.items[0].quantity, 2);
    });
  });
}