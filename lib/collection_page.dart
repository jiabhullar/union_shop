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
          child: Column(
            children: [
              Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
          ),
        ),
      ),
    );
  }
}
          sizedBox(height: 20),

          gridView.count(
            shrinkWrap = true,
            physics = const NeverScrollableScrollPhysics(),
            crossAxisCount = 2,
            crossAxisSpacing = 16,
            mainAxisSpacing = 16,
            children = const [
              _ProductTile(
                title: "Campus Hoodie",
                price: "£29.99",
                imageUrl: "https://via.placeholder.com/300?text=Hoodie",
              ),
              _ProductTile(
                title: "Union Mug",
                price: "£9.99",
                imageUrl: "https://via.placeholder.com/300?text=Mug",
              ),
              _ProductTile(
                title: "Notebook",
                price: "£4.99",
                imageUrl: "https://via.placeholder.com/300?text=Notebook",
              ),
              _ProductTile(
                title: "Lanyard",
                price: "£2.99",
                imageUrl: "https://via.placeholder.com/300?text=Lanyard",
              ),
            ]
          ),


class _ProductTile extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const _ProductTile({
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
