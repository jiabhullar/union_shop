import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/data/sample_products.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String selectedSort = "popular";
  String selectedFilter = "all";

  @override
  Widget build(BuildContext context) {
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

              const SizedBox(height: 24),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: sampleProducts.length,
                itemBuilder: (context, index) {
                  final product = sampleProducts[index];
                  return ProductCard(
                    title: product.title,
                    price: product.price,
                    imageUrl: product.imageUrl,
                );
              },
            ),
        const SizedBox(height: 24),
        // Footer 
        Container(
          width: double.infinity,
          color: Colors.grey[50],
          padding: const EdgeInsets.all(24),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '© 2025 Union Shop',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Home | About | Contact | Privacy Policy',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}