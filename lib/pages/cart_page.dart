import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../services/cart_service.dart';
import '../models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

  void refresh() => setState(() {});

  final items = CartService.instance.items;
  final total = CartService.instance.getTotal();