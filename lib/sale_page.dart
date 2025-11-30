import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              )
            ),

            const SizedBox(height: 16),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                SaleProductTile(
                    title: "Campus Hoodie",
                    originalPrice: "£39.99",
                    salePrice: "£29.99",
                    imageUrl: "https://via.placeholder.com/300?text=Hoodie",
                  ),
                  SaleProductTile(
                    title: "Union Mug",
                    originalPrice: "£12.99",
                    salePrice: "£9.99",
                    imageUrl: "https://via.placeholder.com/300?text=Mug",
                  ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class SaleProductTile extends StatelessWidget {
  final String title;
  final String originalPrice;
  final String salePrice;
  final String imageUrl;

  const SaleProductTile({
    super.key,
    required this.title,
    required this.originalPrice,
    required this.salePrice,
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
          child: Image.network(imageUrl,fit: BoxFit.cover,)
          ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 14)),
        Row(
          children: [
            Text(
              originalPrice,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              salePrice,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}