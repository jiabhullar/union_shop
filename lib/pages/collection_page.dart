import 'package:flutter/material.dart';
import 'package:union_shop/widgets/nav_bar.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionPage extends StatefulWidget {
  final String collectionName;

  const CollectionPage({super.key, required this.collectionName});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}
