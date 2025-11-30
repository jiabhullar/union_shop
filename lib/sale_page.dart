import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [],
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            color: Colors.redAccent,
            child: Text(
              'Sale Page - Coming Soon!',
          )
      ),
      ),
    );
  }
}