import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';

class PersonalisationAboutPage extends StatelessWidget {
  const PersonalisationAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "About Print Shack",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Print Shack is our custom personalisation service. You can add your own text to T-Shirts, Hoodies, and Mugs. "
              "Our mission is to provide students with unique, high-quality personalised merchandise.",
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
            SizedBox(height: 32),
            Footer(),
          ],
        ),
      ),
    );
  }
}