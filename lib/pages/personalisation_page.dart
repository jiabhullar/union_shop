import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';

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
              const Text("Mugs have a default white colour."),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Order placed: $selectedProductType with '$textInput' in $colour",
                    ),
                  ),
                );
              },
              child: const Text("Submit Personalisation"),
            ),
          ],
        ),
      ),
    );
  }
}