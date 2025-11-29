import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  final String collectionName;

  const CollectionPage({super.key, required this.collectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Sort by",
                    border: OutlineInputBorder()
                  ),
                  items: const [
                    DropdownMenuItem(value: "popular", child: Text("Most Popular")),
                    DropdownMenuItem(value: "price_low", child: Text("Price: Low to High")),
                    DropdownMenuItem(value: "price_high", child: Text("Price: High to Low")),
                  ],
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Filter by",
                    border: OutlineInputBorder()
                  ),
                  items: const [
                    DropdownMenuItem(value: "all", child: Text("All Items")),
                    DropdownMenuItem(value: "new", child: Text("New")),
                    DropdownMenuItem(value: "sale", child: Text("Sale")),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const _ProductTile({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image will be added later
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(price, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
