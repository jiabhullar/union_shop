import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';

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
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              originalPrice,
              style: const TextStyle(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(height: 2),
            Text(
              salePrice,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}