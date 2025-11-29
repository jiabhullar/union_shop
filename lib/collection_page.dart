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
            ],
          ),
          const SizedBox(height: 16),
        ),
      ),
    );
  }
}