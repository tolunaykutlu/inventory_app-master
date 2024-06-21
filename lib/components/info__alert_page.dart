import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/extensions/get_size.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';
import 'package:inventory_app/models/fason_kesim_model.dart';
import 'package:inventory_app/models/product_model.dart';
import 'package:inventory_app/providers/input_controllers.dart';

SizedBox infoPage(List<ProductModel> product, int index, BuildContext context) {
  return SizedBox(
    height: context.deviceHeight / 2,
    child: AlertDialog(
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
                  "Ebat : ${product[index].quality.toString()} x ${product[index].thickness.toString()} x ${product[index].en.toString()} x ${product[index].boy.toString()}",
            ),
            DialogText(
              item: "Kilo : ${product[index].kilo.toString()} kilo",
            ),
            if (product[index].adet != null)
              DialogText(
                item: "Adet : ${product[index].adet} adet",
              ),
            DialogText(
              item: "Fiyat : ${product[index].fiyat.toString()}\$",
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
    ),
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
              item: "Firma : ${fasonProduct[index].firmName.toString()} "
                  .toUpperCase()),
          DialogText(
              item: "Tarih : ${fasonProduct[index].entryDate.toString()}"),
          DialogText(
              item:
                  "Ebat : ${fasonProduct[index].quality.toString()} x ${fasonProduct[index].thickness.toString()} x ${fasonProduct[index].en.toString()} x ${fasonProduct[index].boy.toString()}"),
          DialogText(
              item: "Kilo : ${fasonProduct[index].kilo.toString()} kilo"),
          DialogText(item: "Adet : ${fasonProduct[index].adet} adet"),
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
                        changeAdet(ref, fasonProduct, index, context);
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

changeAdet(WidgetRef ref, List<FasonWork> fasonProduct, int index,
    BuildContext context) {
  int i = int.parse(ref.read(inputProvider).adet.text);
  if (i >= 0) {
    ref.read(firebaseProvider).updateDataToFirestore(
        //adet değiştirme methodu
        {
          "adet": i,
        },
        fasonProduct[index].id.toString(),
        "fasons").whenComplete(() => showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Adet başarıyla değişti"),
            );
          },
        ));
  }
}

changeAdetProduct(WidgetRef ref, List<ProductModel> product, int index) {
  ref.read(firebaseProvider).updateDataToFirestore(
    {"kilo": ref.read(inputProvider).adet.text},
    product[index].id.toString(),
    product[index].quality.toString(),
  );
}
