import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionPage extends StatefulWidget {
  final String collectionName;

  const CollectionPage({super.key, required this.collectionName});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}
class _CollectionPageState extends State<CollectionPage> {
  String selectedSort = "popular";
  String selectedFilter = "all";

  int currentPage = 0;
  final int itemsPerPage = 4;

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = ProductService.getProductsForCollection(widget.collectionName);
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = products.where((product) {
      if (selectedFilter == "all") return true;
      return product.tag == selectedFilter;
    }).toList();

    switch (selectedSort) {
      case "price_low":
        filteredProducts.sort((a, b) =>
            double.parse(a.price.replaceAll('£', '')).compareTo(
                double.parse(b.price.replaceAll('£', ''))));
        break;
      case "price_high":
        filteredProducts.sort((a, b) =>
            double.parse(b.price.replaceAll('£', '')).compareTo(
                double.parse(a.price.replaceAll('£', ''))));
        break;
      default:
        break;
    }
  }