import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/pages/personalisation_page.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: const NavBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported, size: 64),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Title
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Price
                  Text(
                    '£${product.price.toString()}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963)),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // Size Dropdown
                    DropdownButton<String>(
                      value: selectedSize,
                      items: ['S', 'M', 'L', 'XL']
                          .map((size) =>
                              DropdownMenuItem(value: size, child: Text(size)))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedSize = value!);
                      },
                    ),
                  const SizedBox(height: 16),
                  // Quantity Selector
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() => quantity++),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      CartService.instance.addToCart(
                        widget.product,
                        quantity: quantity,
                        size: selectedSize,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${widget.product.title} added to cart!')),
                      );
                    },
                    child: const Text("Add to Cart"),
                  ),
                  const SizedBox(height: 8),
                  // Personalise Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PersonalisationPage()),
                      );
                    },
                    child: const Text("Personalise"),
                  ),
                  const Footer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  