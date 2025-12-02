import 'package:union_shop/models/product.dart';

class CartItem {
  final Product product;
  int quantity;
  String size;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.size = "M",
  });
}