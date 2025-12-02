import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/data/sample_products.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

    final List<Map<String, String>> collections = const [
    {"name": "Clothing", "image": "assets/images/collection_clothing.jpg"},
    {"name": "Accessories", "image": "assets/images/collection_accessories.jpg"},
    {"name": "Stationery", "image": "assets/images/collection_stationery.jpg"},
    {"name": "Gifts", "image": "assets/images/collection_gifts.jpg"},
    {"name": "Union Merch", "image": "assets/images/collection_union.jpg"},
    {"name": "Sale", "image": "assets/images/collection_sale.jpg"},
  ];

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Collections",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

    return Scaffold(
      appBar: const NavBar(),
      backgroundColor: const Color(0xFF6200EE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Our Collections',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
               Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedSort,
                      items: const [
                        DropdownMenuItem(value: "popular", child: Text("Most Popular")),
                        DropdownMenuItem(value: "price_low", child: Text("Price: Low to High")),
                        DropdownMenuItem(value: "price_high", child: Text("Price: High to Low")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSort = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedFilter,
                        items: const [
                          DropdownMenuItem(value: "all", child: Text("All Items")),
                          DropdownMenuItem(value: "new", child: Text("New")),
                          DropdownMenuItem(value: "sale", child: Text("Sale")),
                        ],
                      onChanged: (value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: filteredProducts
                    .map((product) => ProductCard(product: product))
                    .toList(),
              ),
        const SizedBox(height: 24),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}