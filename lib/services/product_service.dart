 import 'package:union_shop/models/product.dart';

class ProductService {
  static List<Product> getProductsForCollection(String collectionName) {
    return [
      Product(
        title: "Campus Hoodie",
        price: "£29.99",
        tag: "new",
        imageUrl: "assets/images/hoodie.jpeg",
        description: "A comfortable hoodie perfect for campus life.",   
      ),
      Product(
        title: "Union Mug",
        price: "£9.99",
        originalPrice: "£12.99",
        tag: "sale",
        imageUrl: "assets/images/mug.jpeg",
        description: "A stylish mug to enjoy your favorite beverages.",
      ),
      Product(
        title: "Notebook",
        price: "£4.99",
        originalPrice: "£6.99",
        tag: "sale",
        imageUrl: "assets/images/notebook.jpeg",
        description: "A handy notebook for jotting down your thoughts.",
      ),
      Product(
        title: "Lanyard",
        price: "£2.99",
        tag: "all",
        imageUrl: "assets/images/lanyard.jpeg",
        description: "A durable lanyard for your ID or keys.",
      ),
      Product(
        title: "T-Shirt", 
        price: "£15",
        imageUrl: "assets/images/tshirt.jpeg",
        tag: "new",
        description: "A comfortable cotton t-shirt.",
        ),
      Product(
        title: "Cap", 
        price: "£12", 
        imageUrl: "assets/images/cap.jpeg",
        tag: "popular",
        description: "A trendy cap to shield you from the sun.",
        ),
      Product(
        title: "Bag", 
        price: "£20", 
        imageUrl: "assets/images/bag.jpeg",
        tag: "popular",
        description: "A spacious bag for all your essentials.",
        ),
      Product(
        title: "Sticker", 
        price: "£3", 
        imageUrl: "assets/images/sticker.jpeg",
        tag: "new",
        description: "A cool sticker to decorate your belongings.",
        ),
    ];
  }
}