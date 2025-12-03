import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/sale_product_tile.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of sale products
    final saleProducts = [
      {
        "title": "Campus Hoodie",
        "originalPrice": "£39.99",
        "salePrice": "£29.99",
        "imageUrl": "assets/images/hoodie.jpg",
      },
      {
        "title": "Union Mug",
        "originalPrice": "£12.99",
        "salePrice": "£9.99",
        "imageUrl": "assets/images/mug.jpg",
      },
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Sale')), // or your NavBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.redAccent,
              child: const Text(
                'SALE - UP TO 50% OFF!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Sale products grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: saleProducts.map((product) {
                  return SaleProductTile(
                    title: product['title']!,
                    originalPrice: product['originalPrice']!,
                    salePrice: product['salePrice']!,
                    imageUrl: product['imageUrl']!,
                  );
                }).toList(),
              ),
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
