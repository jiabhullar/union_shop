import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
                "About Us",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16), 
            Image.asset(
              "assets/images/about_header.jpg",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 24),

            const Text(
              "We are the official Union Shop for students at the University of Portsmouth..."
              "\n\nOur mission is to provide high-quality merchandise that represents the student community.",
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
            
            const SizedBox(height: 32),
              // Footer
              Container(
                width: double.infinity,
                color: Colors.grey[50],
                padding: const EdgeInsets.all(24),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '© 2025 Union Shop',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Home | About | Contact | Privacy Policy',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
