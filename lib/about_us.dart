import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Welcome to The Union Shop! We are dedicated to providing students with high-quality merchandise that represents our campus spirit. Our mission is to offer a wide range of products, from apparel to accessories, that allow students to showcase their pride and support for our university. We believe in fostering a sense of community and belonging through our carefully curated selection of items. Thank you for choosing The Union Shop as your go-to destination for all things campus-related!',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
