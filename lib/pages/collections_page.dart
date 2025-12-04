import 'package:flutter/material.dart';
import 'package:union_shop/data/sample_products.dart';
import 'package:union_shop/models/sale_product_tile.dart';
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
            body: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                int crossAxisCount = width > 600 ? 2 : 1;

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
                    return SaleProductTile(
                      title: product.title,
                      imageUrl: product.imageUrl,
                      salePrice: product.price,
                      originalPrice: product.originalPrice ?? '',
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer()
    );
   }
}
