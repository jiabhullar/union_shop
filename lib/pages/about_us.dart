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
                'Welcome to The Union Shop! We are dedicated to providing students with high-quality merchandise that represents our campus spirit. Our mission is to offer a wide range of products, from apparel to accessories, that allow students to showcase their pride and support for our university. We believe in fostering a sense of community and belonging through our carefully curated selection of items. Thank you for choosing The Union Shop as your go-to destination for all things campus-related!',
                style: TextStyle(fontSize: 16),
              ),
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
