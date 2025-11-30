import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';


class CollectionPage extends StatefulWidget {
  final String collectionName;

  const CollectionPage({super.key, required this.collectionName});
  
  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Our Collections',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              String selectedSort = "popular";
              String selectedFilter = "all";
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedSort,
                      decoration: const InputDecoration(labelText: "Sort by", border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: "popular", child: Text("Most Popular")),
                        DropdownMenuItem(value: "price_low", child: Text("Price: Low to High")),
                        DropdownMenuItem(value: "price_high", child: Text("Price: High to Low")),
                      ],
                      onChanged: (value) {
                        setState(() { selectedSort = value!; });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedFilter,
                      decoration: const InputDecoration(labelText: "Filter by", border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: "all", child: Text("All Items")),
                        DropdownMenuItem(value: "new", child: Text("New")),
                        DropdownMenuItem(value: "sale", child: Text("Sale")),
                      ],
                      onChanged: (value) {
                        setState(() { selectedFilter = value!; });
                      },
                      final List<Map<String, String>> products = [
                        {"title": "Campus Hoodie", "price": "£29.99", "tag": "new"},
                        {"title": "Union Mug", "price": "£9.99", "tag": "sale"},
                        {"title": "Notebook", "price": "£4.99", "tag": "all"},
                        {"title": "Lanyard", "price": "£2.99", "tag": "all"},
                        ];
                        final filteredProducts = products.where((product) {
                          if (selectedFilter == "all") return true;
                          return product["tag"] == selectedFilter;
                        }).toList();

                        if (selectedSort == "price_low") {
                          filteredProducts.sort((a, b) =>
                              double.parse(a["price"]!.substring(1))
                                  .compareTo(double.parse(b["price"]!.substring(1))));
                        } else if (selectedSort == "price_high") {
                          filteredProducts.sort((a, b) =>
                              double.parse(b["price"]!.substring(1))
                                  .compareTo(double.parse(a["price"]!.substring(1))));
                        }
                    ),
                  ),
                ],
              )
          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ProductCard(
                title: product.title,
                price: product.price,
                imageUrl: product.imageUrl,
              );
            },
          )
            ],
          ),
        ),
      ),
    );
  }
}