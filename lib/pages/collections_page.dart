import 'package:flutter/material.dart';
import 'package:union_shop/data/sample_products.dart';
import 'package:union_shop/models/sale_product_tile.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/services/collection_service.dart';

class CollectionsPage extends StatelessWidget {
  CollectionsPage({super.key});

  final collections = CollectionService.getCollections();

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
          Scaffold(
  appBar: const NavBar(),
  body: SafeArea(
    child: LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 2,
          ),
          itemCount: sampleProducts.length,
          itemBuilder: (context, index) {
            final product = sampleProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductPage(product: product),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
