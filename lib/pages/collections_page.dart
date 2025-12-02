import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

    final List<Map<String, String>> collections = const [
    {"name": "Clothing", "image": "assets/images/collection_clothing.jpg"},
    {"name": "Accessories", "image": "assets/images/collection_accessories.jpg"},
    {"name": "Stationery", "image": "assets/images/collection_stationery.jpg"},
    {"name": "Gifts", "image": "assets/images/collection_gifts.jpg"},
    {"name": "Union Merch", "image": "assets/images/collection_union.jpg"},
    {"name": "Sale", "image": "assets/images/collection_sale.jpg"},
  ];

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
                    Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final c = collections[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/collections/${c['name']!.toLowerCase()}",
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          c["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(c["name"]!, style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              },
            ),
          ),

          const Footer(),
        ],
      ),
    );
  }
}
