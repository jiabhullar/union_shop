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
  final int itemsPerPage = 2; 

  List<Product> products = [];
  
  @override
  void initState() {
    super.initState();
    products = ProductService.getProductsForCollection(widget.collectionName);
  }

  @override
  Widget build(BuildContext context) {
      final filteredProducts = products.where((product) {
        if (selectedFilter == "all") return true;
        return product.tag == selectedFilter;
      }).toList();

      if (selectedSort == "price_low") {
        filteredProducts.sort((a, b) =>
          double.parse(a.price.substring(1))
              .compareTo(double.parse(b.price.substring(1))));
      } else if (selectedSort == "price_high") {
        filteredProducts.sort((a, b) =>
          double.parse(b.price.substring(1))
              .compareTo(double.parse(a.price.substring(1))));
      }

      final start = currentPage * itemsPerPage;
      final end = (start + itemsPerPage).clamp(0, filteredProducts.length);
      final paginatedProducts = filteredProducts.sublist(start, end);
            
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Our Collections',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedSort,
                      decoration: const InputDecoration(labelText: "Sort by", border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: "popular", child: Text("Most Popular")),
                        DropdownMenuItem(value: "price_low", child: Text("Price: Low to High")),
                        DropdownMenuItem(value: "price_high", child: Text("Price: High to Low")),
                      ],
                      onChanged: (value) {
                        setState(() { selectedSort = value!; });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedFilter,
                      decoration: const InputDecoration(labelText: "Filter by", border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: "all", child: Text("All Items")),
                        DropdownMenuItem(value: "new", child: Text("New")),
                        DropdownMenuItem(value: "sale", child: Text("Sale")),
                      ],
                      onChanged: (value) {
                        setState(() { selectedFilter = value!; });
                      },
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: paginatedProducts.length,
            itemBuilder: (context, index) {
              final product = paginatedProducts[index];
              return ProductCard(
                title: product.title,
                price: "£${product.price}",
                imageUrl: product.imageUrl,
              );

            },
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: currentPage > 0
                    ? () {
                        setState(() => currentPage--);
                      }
                    : null,
                child: const Text("Previous"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: (currentPage + 1) * itemsPerPage < filteredProducts.length
                    ? () {
                        setState(() => currentPage++);
                      }
                    : null,
                child: const Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}