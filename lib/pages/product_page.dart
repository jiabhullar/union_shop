import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/pages/personalisation_page.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

  }
}