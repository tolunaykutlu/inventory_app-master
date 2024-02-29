import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductInputNotifiers extends ChangeNotifier {
  String qualityValue = "";
  final TextEditingController thicknessValue = TextEditingController();
  final TextEditingController enValue = TextEditingController();
  TextEditingController boyValue = TextEditingController();
  final TextEditingController kiloValue = TextEditingController();
  final TextEditingController fiyatValue = TextEditingController();
  final TextEditingController firmaName = TextEditingController();
  final TextEditingController description = TextEditingController();

  void clearControllers() {
    boyValue.text = "";
    enValue.text = "";
    kiloValue.text = "";
    thicknessValue.text = "";
    firmaName.text = "";
    description.text = "";
    fiyatValue.text = "";
    notifyListeners();
  }
}

final inputProvider = ChangeNotifierProvider<ProductInputNotifiers>((ref) {
  return ProductInputNotifiers();
});
