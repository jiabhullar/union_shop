 import 'package:union_shop/models/product.dart';

class ProductService {
  static List<Product> getProductsForCollection(String collectionName) {
    return [
      Product(
        title: "Campus Hoodie",
        price: ("29.99"),
        tag: "new",
        imageUrl: "https://via.placeholder.com/300?text=Hoodie",
      ),
      Product(
        title: "Union Mug",
        price: ("9.99"),
        tag: "sale",
        imageUrl: "https://via.placeholder.com/300?text=Mug",
      ),
      Product(
        title: "Notebook",
        price: ("4.99"),
        tag: "all",
        imageUrl: "https://via.placeholder.com/300?text=Notebook",
      ),
      Product(
        title: "Lanyard",
        price: ("2.99"),
        tag: "all",
        imageUrl: "https://via.placeholder.com/300?text=Lanyard",
      ),
    ];
  }
}
