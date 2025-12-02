import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/cart_item.dart';  

class CartService { 
  CartService._privateConstructor();
static final CartService _instance = CartService._privateConstructor();
static CartService get instance => _instance;

final List<CartItem> _items = [];
List<CartItem> get items => _items;
}
