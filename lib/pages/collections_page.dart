import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/data/sample_products.dart';


class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150, 
          width: double.infinity,
          child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Center(
              child:  Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          );
        },
      ),
    ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          maxLines: 2,
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

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
              const SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  ProductCard(
                    title: 'T-Shirts Collection',
                    price: 'Various Prices',
                    imageUrl: 'https://via.placeholder.com/300x300.png?text=T-Shirts',
              ),
                  ProductCard(
                    title: 'Mugs Collection',
                    price: 'Various Prices',
                    imageUrl: 'https://via.placeholder.com/300x300.png?text=Mugs',
              ),
                  ProductCard(
                    title: 'Stationery Collection',
                    price: 'Various Prices',
                    imageUrl: 'https://via.placeholder.com/300x300.png?text=Stationery',
            ),
                  ProductCard(
                    title: 'Accessories Collection',
                    price: 'Various Prices',
                    imageUrl: 'https://via.placeholder.com/300x300.png?text=Accessories',
              ),
            ],
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