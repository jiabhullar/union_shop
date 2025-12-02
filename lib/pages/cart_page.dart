import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/models/cart_item.dart';

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
          ? const Center(child: Text("Your cart is empty")):
           Column(
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
                      subtitle: Text('Size: ${item.size} — £${price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  setState(() => item.quantity--);
                                }
                              },
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() => item.quantity++);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  CartService.instance.removeFromCart(item);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total: £${total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Checkout complete!")),
                          );
                          CartService.instance.clearCart();
                          refresh();
                        },
                        child: const Text("Checkout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}