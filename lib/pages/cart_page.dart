import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../services/cart_service.dart';
import '../models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void refresh() => setState(() {});
 
 @override
  Widget build(BuildContext context) {
    final items = CartService.instance.items;
    final total = CartService.instance.getTotal();
    return Scaffold(
      appBar: const NavBar(),
      body: items.isEmpty
          ? const Center(child: Text("Your cart is empty")),
          : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final CartItem item = items[index];
                    final price = double.tryParse(item.product.price.replaceAll('£', '')) ?? 0;
                      return ListTile(
                        leading: Image.network(item.product.imageUrl, width: 50, height: 50),
                        title: Text(item.product.title),
                        subtitle: Text('Size: ${item.size}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [