import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 700;

    return Container(
      color: const Color(0xFF4d2963),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Left side
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

          // Menu (scrollable instead of Spacer)
          Expanded(
            child: isWide
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _navButton(context, 'Home', '/'),
                        _navButton(context, 'About', '/about'),
                        _navButton(context, 'Collections', '/collections'),

                        PopupMenuButton<String>(
                          child: const Text(
                            'Print Shack',
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (value) {
                            Navigator.pushNamed(context, value);
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                              value: '/personalise',
                              child: Text('Print Shack'),
                            ),
                            PopupMenuItem(
                              value: '/personalise_about',
                              child: Text('About Print Shack'),
                            ),
                          ],
                        ),

                        _navButton(context, 'Sale', '/sale'),
                        _navButton(context, 'Cart', '/cart'),
                        _navButton(context, 'Account', '/auth'),
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => ListView(
                            children: [
                              _sheetItem(context, "Home", '/'),
                              _sheetItem(context, "About", '/about'),
                              _sheetItem(context, "Collections", '/collections'),
                              _sheetItem(context, "Print Shack", '/personalise'),
                              _sheetItem(context, "About Print Shack", '/personalise_about'),
                              _sheetItem(context, "Sale", '/sale'),
                              _sheetItem(context, "Cart", '/cart'),
                              _sheetItem(context, "Account", '/auth'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _sheetItem(BuildContext context, String label, String route) {
    return ListTile(
      title: Text(label),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
