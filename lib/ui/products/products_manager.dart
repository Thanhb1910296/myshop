import '../../models/product.dart';

class ProductManager {
  final List<Product> _items = [];

  int get itemCount {
    return _items.length;
  }
  
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((proItem) => proItem.isFavorite).toList();
  }
}