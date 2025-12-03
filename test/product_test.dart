import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Model', () {
    test('should create Product instance correctly', () {
      final product = Product(
        title: 'Test Product',
        price: '15.00',
        imageUrl: 'assets/images/test.jpg',
        tag: 'new',
        description: 'A test product',
      );
      
      expect(product.title, 'Test Product');
      expect(product.price, '15.00');
      expect(product.imageUrl, 'assets/images/test.jpg');
      expect(product.tag, 'new');
      expect(product.description, 'A test product');
   });
});
}