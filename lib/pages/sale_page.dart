import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
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
            const Footer(),
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
      children: [
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
      ],
    );
  }
}