import 'package:flutter/material.dart';
import 'package:inventory_app/models/product_model.dart';

AlertDialog infoPage(List<ProductModel> product, int index) {
  return AlertDialog(
    title: const Center(child: Text("Malzeme Bilgileri")),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      Column(
        //TODO: burası yapılcak
        children: [
          Text(product[index].entryDate.toString()),
          Text(product[index].quality.toString()),
          Text(product[index].thickness.toString()),
          Text(product[index].en.toString()),
          Text(product[index].boy.toString()),
          Text(product[index].kilo.toString()),
          Text("${product[index].fiyat.toString()}\$"),
          product[index].hasPvc != false
              ? const Text("PVC'li")
              : const Text("PVC'siz")
        ],
      )
    ],
  );
}
