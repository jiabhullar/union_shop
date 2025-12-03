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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        const SizedBox(height: 16),
        const Text(
          "Sale",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
    
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: Image.asset("assets/images/sale_item.jpg"),
                title: const Text("Hoodie"),
                subtitle: const Text("Was £30.00"),
                trailing: const Text(
                  "£20.00",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Footer(),
      ),
    );
  }
}