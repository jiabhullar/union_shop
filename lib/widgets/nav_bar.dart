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
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/collections'),
              child: const Text('Collections', style: TextStyle(color: Colors.white)),
            ),
            PopupMenuButton<String>(
              child: const Text('Print Shack', style: TextStyle(color: Colors.white)),
              onSelected: (value) {
                Navigator.pushNamed(context, value);
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: '/personalise',
                  child: Text('Print Shack'),
                ),
                const PopupMenuItem(
                  value: '/personalise_about',
                  child: Text('About Print Shack'),
                ),
              ],
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/collections', arguments: "sale"),
              child: const Text('Sale', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              child: const Text('Cart', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/auth'),
              child: const Text('Account', style: TextStyle(color: Colors.white)),
            ),
  ]else ...[
  IconButton(
    icon: const Icon(Icons.menu, color: Colors.white),
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (_) => Column(
          children: [
            ListTile(title: const Text("Home"), onTap: () => Navigator.pushNamed(context, '/')),
            ListTile(title: const Text("About"), onTap: () => Navigator.pushNamed(context, '/about')),
            ListTile(title: const Text("Collections"), onTap: () => Navigator.pushNamed(context, '/collections')),
            ListTile(title: const Text("Print Shack"), onTap: () => Navigator.pushNamed(context, '/personalise')),
            ListTile(title: const Text("About Print Shack"), onTap: () => Navigator.pushNamed(context, '/personalise_about')),
            ListTile(title: const Text("Sale"), onTap: () => Navigator.pushNamed(context, '/sale')),
            ListTile(title: const Text("Cart"), onTap: () => Navigator.pushNamed(context, '/cart')),
            ListTile(title: const Text("Account"), onTap: () => Navigator.pushNamed(context, '/auth')),
          ],
        ),
      );
    },
  )
        ],
      ],
      ),
    );
  }
    @override
    Size get preferredSize => const Size.fromHeight(60);
}