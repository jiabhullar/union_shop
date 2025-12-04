import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/services/product_service.dart';

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

    final start = currentPage * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, filteredProducts.length);
    final pageItems = filteredProducts.sublist(start, end);

    return Scaffold(
      appBar: const NavBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 800;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  widget.collectionName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Sort + Filter
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: selectedSort,
                        decoration: const InputDecoration(
                          labelText: "Sort by",
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: "popular", child: Text("Most Popular")),
                          DropdownMenuItem(value: "price_low", child: Text("Price: Low to High")),
                          DropdownMenuItem(value: "price_high", child: Text("Price: High to Low")),
                        ],
                        onChanged: (value) {
                          setState(() => selectedSort = value!);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: selectedFilter,
                        decoration: const InputDecoration(
                          labelText: "Filter by",
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: "all", child: Text("All Items")),
                          DropdownMenuItem(value: "new", child: Text("New")),
                          DropdownMenuItem(value: "sale", child: Text("Sale")),
                        ],
                        onChanged: (value) {
                          setState(() => selectedFilter = value!);
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWide ? 4: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isWide ? 3/4 : 2/3,
                    ),
                    itemCount: pageItems.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: pageItems[index]);
                    },
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: currentPage > 0
                          ? () => setState(() => currentPage--)
                          : null,
                      child: const Text("Previous"),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: (currentPage + 1) * itemsPerPage <
                              filteredProducts.length
                          ? () => setState(() => currentPage++)
                          : null,
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 