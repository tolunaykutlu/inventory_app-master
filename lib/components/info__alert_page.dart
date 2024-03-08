import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';
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
            "${product[index].entryDate.toString()} ".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${product[index].quality.toString()} x ${product[index].thickness.toString()} x ${product[index].en.toString()} x ${product[index].boy.toString()}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          AppConsts.appText("${product[index].kilo} kilo"),
          if (product[index].adet != null)
            Text(
              "${product[index].adet} adet",
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
                ),
          Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    child: CustomTextFormField(
                        title: "kilo",
                        hintText: "0",
                        controller: ref.read(inputProvider).adet),
                  ),
                  UpdateButton(
                    buttonName: "Güncelle",
                    ref: ref,
                    onPressed: () {
                      changeAdetProduct(ref, product, index);
                      ref.read(inputProvider).clearControllers();
                    },
                  )
                ],
              );
            },
          )
        ],
      )
    ],
  );
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.ref,
    this.onPressed,
    required this.buttonName,
  });
  final WidgetRef ref;
  final void Function()? onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttonName));
  }
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
            "Firma adı ${fasonProduct[index].firmName.toString()} "
                .toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            fasonProduct[index].entryDate.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${fasonProduct[index].quality.toString()} x ${fasonProduct[index].thickness.toString()} x ${fasonProduct[index].en.toString()} x ${fasonProduct[index].boy.toString()}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${fasonProduct[index].kilo.toString()} kilo",
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
          Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 90,
                    child: CustomTextFormField(
                        title: "adet ",
                        hintText: "0",
                        controller: ref.read(inputProvider).adet),
                  ),
                  UpdateButton(
                    buttonName: "Güncelle",
                    ref: ref,
                    onPressed: () {
                      changeAdet(ref, fasonProduct, index);
                      ref.read(inputProvider).clearControllers();
                    },
                  )
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
        "fasons",
        //adet değiştirme methodu
        {
          "adet": int.parse(ref.read(inputProvider).adet.text),
        },
        fasonProduct[index].id.toString(),
      );
}

changeAdetProduct(WidgetRef ref, List<ProductModel> product, int index) {
  ref.read(firebaseProvider).updateDataToFirestore(
        product[index].quality.toString(),
        //adet değiştirme methodu
        {
          "kilo": ref.read(inputProvider).adet.text,
        },
        product[index].id.toString(),
      );
}
