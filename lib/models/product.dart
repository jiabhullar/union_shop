class Product {
  final String title;
  final String price; 
  final String? originalPrice;
  final String imageUrl;
  final String tag;
  final String description;

  Product({
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,  
    required this.tag,
    required this.description,
  });

  bool get onSale => originalPrice != null;
}