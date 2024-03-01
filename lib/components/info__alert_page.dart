import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/models/fason_kesim_model.dart';
import 'package:inventory_app/models/product_model.dart';
import 'package:inventory_app/providers/input_controllers.dart';

AlertDialog infoPage(List<ProductModel> product, int index) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: const Center(child: Text("Malzeme Bilgileri")),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      Column(
        children: [
          Text(
            product[index].entryDate.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product[index].quality.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product[index].thickness.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product[index].en.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product[index].boy.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product[index].kilo.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${product[index].fiyat.toString()}\$",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          product[index].hasPvc != false
              ? const Text(
                  "PVC'li",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : const Text(
                  "PVC'siz",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
        ],
      )
    ],
  );
}

AlertDialog infoPageForFason(List<FasonWork> fasonProduct, int index) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: const Center(child: Text("Fason Malzeme Bilgileri")),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fasonProduct[index].entryDate.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].firmName.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].quality.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].thickness.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].en.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].boy.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].kilo.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${fasonProduct[index].adet} adet",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].description.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].description.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Consumer(
            builder: (context, ref, child) {
              return CustomTextFormField(
                  iconB: IconButton(
                      onPressed: () {
                        //TODO: adet güncelleme methodu yazılacak
                      },
                      icon: const Icon(Icons.change_circle)),
                  title: "adet ",
                  hintText: "0",
                  controller: ref.read(inputProvider).adet);
            },
          )
        ],
      )
    ],
  );
}
