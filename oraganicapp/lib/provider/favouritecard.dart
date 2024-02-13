import 'package:flutter/material.dart';
import 'package:oraganicapp/model/allproducts.dart';

import 'package:provider/provider.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favouriteProducts = [];
  List<Product> get favouriteProducts => _favouriteProducts;
  void toggleFavourite(Product product) {
    if (_favouriteProducts.contains(product)) {
      _favouriteProducts.remove(product);
    } else {
      _favouriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favouriteProducts.contains(product);
    return isExist;
  }

  static FavouriteProvider getFavouriteProvider(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavouriteProvider>(context, listen: listen);
  }
}
