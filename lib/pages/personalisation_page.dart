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
      appBar: 
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [