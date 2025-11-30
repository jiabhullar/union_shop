class Product {
  final String title;
  final String price;
  final String imageUrl;
  final bool onSale;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.onSale = false,
  });
}