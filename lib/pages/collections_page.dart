import 'package:flutter/material.dart';
import 'package:union_shop/pages/collection_page.dart';
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CollectionPage(collectionName: c.name),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(c.image, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 8),
                      Text(c.name, style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Footer()
        ],
      ),
    );
   }
}
