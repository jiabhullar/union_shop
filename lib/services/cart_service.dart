import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/cart_item.dart';  

class CartService { 
  CartService._privateConstructor();
static final CartService _instance = CartService._privateConstructor();
static CartService get instance => _instance;

final List<CartItem> _items = [];

List<CartItem> get items => _items;

void addToCart(Product product, {int quantity = 1, String size = 'M'}) {
  try {
    // Check if the product + size already exists
    final existing = _items.firstWhere(
      (item) => item.product.title == product.title && item.size == size,
    );
    existing.quantity += quantity;
  } catch (e) {
    // Not found, add new
    _items.add(CartItem(product: product, quantity: quantity, size: size));
  }
}

}
