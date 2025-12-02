 import 'package:union_shop/models/product.dart';

class ProductService {
  static List<Product> getProductsForCollection(String collectionName) {
    return [
      Product(
        title: "Campus Hoodie",
        price: ("29.99"),
        tag: "new",
        imageUrl: "assets/images/hoodie.jpeg",
        description: "A comfortable hoodie perfect for campus life.",   
      ),
      Product(
        title: "Union Mug",
        price: ("9.99"),
        tag: "sale",
        imageUrl: "assets/images/mug.jpeg",
        description: "A stylish mug to enjoy your favorite beverages.",
      ),
      Product(
        title: "Notebook",
        price: ("4.99"),
        tag: "all",
        imageUrl: "assets/images/notebook.jpeg",
        description: "A handy notebook for jotting down your thoughts.",
      ),
      Product(
        title: "Lanyard",
        price: ("2.99"),
        tag: "new",
        imageUrl: "assets/images/lanyard.jpeg",
        description: "A durable lanyard for your ID or keys.",
      ),
    ];
  }
}
