import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:inventory_app/models/product_model.dart';

class DataClass extends ChangeNotifier {
  List asThicknessList = [];
  List<ProductModel> products = [];

  void addProduct(ProductModel pro) {
    products.add(pro);
    notifyListeners();
  }

  void deleteProduct(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}

final dataProvider = ChangeNotifierProvider((ref) {
  return DataClass();
});
