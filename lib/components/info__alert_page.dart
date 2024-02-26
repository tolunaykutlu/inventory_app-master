import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/models/product_model.dart';

AlertDialog infoPage(List<ProductModel> product, int index) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: const Center(child: Text("Malzeme Bilgileri")),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: [
            Text(
              "Tarih",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "Kalite",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "Kalınlık",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "En",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "Boy",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "Kilo",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "Fiyat",
              style: AppConsts.getInstance().syneMono(),
            ),
            Text(
              "PVC",
              style: AppConsts.getInstance().syneMono(),
            ),
          ]),
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
          ),
        ],
      )
    ],
  );
}
