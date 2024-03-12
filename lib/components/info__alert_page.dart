import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';
import 'package:inventory_app/models/fason_kesim_model.dart';
import 'package:inventory_app/models/product_model.dart';
import 'package:inventory_app/providers/input_controllers.dart';

AlertDialog infoPage(List<ProductModel> product, int index) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: const Center(child: Text("Malzeme Bilgileri")),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      Column(
        children: [
          DialogText(
            item: product[index].entryDate.toString(),
          ),
          DialogText(
            item:
                "${product[index].quality.toString()} x ${product[index].thickness.toString()} x ${product[index].en.toString()} x ${product[index].boy.toString()}",
          ),
          DialogText(
            item: "${product[index].kilo.toString()} kilo",
          ),
          if (product[index].adet != null)
            DialogText(
              item: "${product[index].adet} adet",
            ),
          DialogText(
            item: "${product[index].fiyat.toString()}\$",
          ),
          product[index].hasPvc != false
              ? const DialogText(
                  item: "PVC var",
                )
              : const DialogText(
                  item: "PVC yok",
                ),
          Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    child: CustomTextFormField(
                        inpuType: TextInputType.number,
                        title: "kilo",
                        hintText: "0",
                        controller: ref.read(inputProvider).adet),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        changeAdetProduct(ref, product, index);
                        ref.read(inputProvider).clearControllers();
                      },
                      child: const Text("Kilo güncelle"))
                ],
              );
            },
          )
        ],
      )
    ],
  );
}

class DialogText extends StatelessWidget {
  const DialogText({
    super.key,
    required this.item,
  });
  final String item;
  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

AlertDialog infoPageForFason(List<FasonWork> fasonProduct, int index) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: const Center(child: Text("Fason Malzeme Bilgileri")),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DialogText(
              item: "Firma adı : ${fasonProduct[index].firmName.toString()} "
                  .toUpperCase()),
          DialogText(item: fasonProduct[index].entryDate.toString()),
          DialogText(
              item:
                  "${fasonProduct[index].quality.toString()} x ${fasonProduct[index].thickness.toString()} x ${fasonProduct[index].en.toString()} x ${fasonProduct[index].boy.toString()}"),
          DialogText(item: "${fasonProduct[index].kilo.toString()} kilo"),
          DialogText(item: "${fasonProduct[index].adet} adet"),
          DialogText(item: fasonProduct[index].description.toString()),
          Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    child: CustomTextFormField(
                        inpuType: TextInputType.number,
                        title: "adet ",
                        hintText: "0",
                        controller: ref.read(inputProvider).adet),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        changeAdet(ref, fasonProduct, index);
                        ref.read(inputProvider).clearControllers();
                      },
                      child: const Text("adet güncelle"))
                ],
              );
            },
          )
        ],
      )
    ],
  );
}

changeAdet(WidgetRef ref, List<FasonWork> fasonProduct, int index) {
  ref.read(firebaseProvider).updateDataToFirestore(
      //adet değiştirme methodu
      {
        "adet": int.parse(ref.read(inputProvider).adet.text),
      },
      fasonProduct[index].id.toString(),
      "fasons");
}

changeAdetProduct(WidgetRef ref, List<ProductModel> product, int index) {
  ref.read(firebaseProvider).updateDataToFirestore(
    {"kilo": ref.read(inputProvider).adet.text},
    product[index].id.toString(),
    product[index].quality.toString(),
  );
}
