class Product {
  final String title;
  final String price;
  final String imageUrl;
  final bool onSale;
  final String tag;
  final String description;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.onSale = false,  
    required this.tag,
    required this.description,
  });
}