class Product {
  final String title;
  final String price;
  final String imageUrl;
  final bool onSale;
  final String tag;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.onSale = false,  
    required this.tag,
  });
}