import 'package:flutter/material.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/sale_product_tile.dart';
import 'package:union_shop/widgets/nav_bar.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final saleProducts = ProductService.getProductsForCollection("all")
    .where((p) => p.onSale)
    .toList();

    return Scaffold(
      appBar: const NavBar(),
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
                    title: product.title,
                    originalPrice: product.originalPrice!,
                    salePrice: product.price,
                    imageUrl: product.imageUrl,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer()
    );
  }
}
