import 'package:union_shop/models/collection.dart';

class CollectionService {
  static List<Collection> getCollections() {
    return [
      Collection(name: "Clothing", image: "assets/images/collection_clothing.jpg"),
      Collection(name: "Accessories", image: "assets/images/collection_accessories.jpg"),
      Collection(name: "Stationery", image: "assets/images/collection_stationery.jpg"),
      Collection(name: "Gifts", image: "assets/images/collection_gifts.jpg"),
      Collection(name: "Union Merch", image: "assets/images/collection_union.jpg"),
      Collection(name: "Sale", image: "assets/images/collection_sale.jpg"),
    ];
  }
}
