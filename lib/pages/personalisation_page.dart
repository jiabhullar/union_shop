import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';


class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  String selectedProductType = "T-Shirt";
  String textInput = "";
  String colour = "Black";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedProductType,
              items: ["T-Shirt", "Hoodie", "Mug"]
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedProductType = value!);
              },
            ),
            const SizedBox(height: 20),  
            TextField(
              decoration: const InputDecoration(
                labelText: "Text to print",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => textInput = value),
            ),
            const SizedBox(height: 20),       
            if (selectedProductType == "T-Shirt" || selectedProductType == "Hoodie")
              DropdownButton<String>(
                value: colour,
                onChanged: (value) => setState(() => colour = value!),
                items: ["Black", "White", "Red", "Blue"]
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
              ),

            if (selectedProductType == "Mug")
    if (selectedProductType != "Mug")
      DropdownButton<String>(
        value: colour,
        onChanged: (value) => setState(() => colour = value!),
        items: ["Black", "White", "Red", "Blue"]
            .map((c) => DropdownMenuItem(value: c, child: Text(c)))
            .toList(),
      ),
    const SizedBox(height: 16),
    Text(
      "Summary: $selectedProductType with text '$textInput'"
      "${selectedProductType != 'Mug' ? ' in $colour colour' : ''}",
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CartService.instance.addToCart(
                  Product(
                    title: "Custom Print",
                    price: "£${selectedProductType == "T-Shirt" ? 20 : selectedProductType == "Hoodie" ? 35 : 10}",
                    imageUrl: "assets/images/${selectedProductType.toLowerCase()}.png",
                    tag: "custom",
                    description: "Text: $textInput${selectedProductType != 'Mug' ? ', Colour: $colour' : ''}",
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart")),
                );
              },
              child: const Text("Submit Personalisation"),
            ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/personalise_about');
                },
                child: const Text('Learn more about Print Shack'),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}