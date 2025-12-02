import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF4d2963),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: const Text(
              'Union Shop',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Spacer(),

          if (MediaQuery.of(context).size.width > 600) ...[
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Home', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/collections'),
              child: const Text('Collections', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/collections', arguments: "sale"),
              child: const Text('Sale', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              child: const Text('Cart', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/auth'),
              child: const Text('Account', style: TextStyle(color: Colors.white)),
            ),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Menu coming soon")),
                );
              },
            )
          ]
        ],
      ),
    );
  }
    @override
    Size get preferredSize => const Size.fromHeight(60);
}