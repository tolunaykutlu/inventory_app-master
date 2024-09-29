import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/components/dropdown_button.dart';
import 'package:inventory_app/components/horizontal_divider.dart';
import 'package:inventory_app/components/info__alert_page.dart';
import 'package:inventory_app/components/list_items.dart';
import 'package:inventory_app/components/page_header.dart';
import 'package:inventory_app/extensions/get_size.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';
import 'package:inventory_app/models/fason_kesim_model.dart';
import 'package:inventory_app/providers/data_controllers.dart';
import 'package:inventory_app/providers/input_controllers.dart';

class FasonPage extends ConsumerStatefulWidget {
  const FasonPage({super.key});

  @override
  ConsumerState<FasonPage> createState() => _FasonPageState();
}

class _FasonPageState extends ConsumerState<FasonPage> {
  FasonWork fasons = FasonWork();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //singleChileScrollView widgetini kullanarak klavye açıldığında headerı itmesini engelle
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: Column(
            children: [
              Header(
                headerText: "Fason Listesi",
                onpress: () {},
              ),
              const HorizontalDivider(),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: newMethod(
                    context,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black),
                  onPressed: () {
                    inventoryProductAddSheet(context);
                  },
                  child: Text(
                    "Fason Ekle",
                    style: AppConsts.syneMono(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox newMethod(BuildContext context) {
    return SizedBox(
        height: context.deviceHeight * 0.6,
        child: StreamBuilder<List<FasonWork>>(
          stream: ref
              .read(firebaseProvider)
              .getAllFasonDocumentsStreamFromFirestore("fasons"),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              var incomingProducts = ref.read(dataProvider).fasons;
              incomingProducts = snapshot.data;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: incomingProducts.length,
                itemBuilder: (context, index) {
                  return listViewItems(incomingProducts, index, context);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else {
              return const Center(
                child: Text("gelşmedi"),
              );
            }
          },
        ));
  }

  Padding listViewItems(
      List<FasonWork> fasons, int index, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 3, bottom: 5, right: 3),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return infoPageForFason(fasons, index);
              },
            );
          },
          onLongPress: () {
            ref.read(firebaseProvider).deleteDocumentFromFirestore(
                  "fasons",
                  fasons[index].id.toString(),
                );
          },
          child: Container(
            height: context.deviceWidth > 500 ? 80 : 60,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                children: [
                  ListItems(
                    flexx: 1,
                    item: fasons[index].firmName!.toUpperCase(),
                  ),
                  ListItems(
                    flexx: 2,
                    item:
                        " ${fasons[index].quality} x ${fasons[index].thickness} x ${fasons[index].en}R",
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<dynamic> inventoryProductAddSheet(BuildContext context) {
    bool isVisible = false;
    var inputPro = ref.read(inputProvider);
    return showModalBottomSheet(
      shape: const BeveledRectangleBorder(),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: MediaQuery.of(context)
                  .viewInsets, //klavye gelince taşmayı önleyici
              child: SizedBox(
                  width: context.deviceWidth,
                  height: context.deviceHeight * 0.5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Form(
                            child: Row(
                          children: [
                            BottomSheetOne(ref: ref),
                            BottomSheetTwo(
                              ref: ref,
                            ),
                          ],
                        )),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: Text(
                          "Ürün başarıyla eklendi",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.green),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (inputPro.qualityValue == "") {
                                inputPro.qualityValue = "430BA";
                              }

                              //boy boş bırakılırsa Rulo olur
                              if (inputPro.boyValue.text == "") {
                                inputPro.boyValue.text = "R";
                              }

                              fasons = FasonWork(
                                  id: "",
                                  entryDate: DateTime.now()
                                      .toString()
                                      .substring(0, 10),
                                  quality: inputPro.qualityValue,
                                  thickness: double.parse(
                                      inputPro.thicknessValue.text),
                                  en: int.parse(inputPro.enValue.text),
                                  boy: inputPro.boyValue.text.toString(),
                                  kilo: int.parse(inputPro.kiloValue.text),
                                  firmName: inputPro.firmaName.text,
                                  description: inputPro.description.text,
                                  writerId: "",
                                  adet: inputPro.adet.text == ""
                                      ? 0
                                      : int.parse(inputPro.adet.text));

                              try {
                                //firebase rules yazılacak
                                ref
                                    .read(firebaseProvider)
                                    .addProductToFasonDb(
                                      fasons,
                                    )
                                    .then((value) {
                                  setState(() {
                                    isVisible = true;
                                    Future.delayed(
                                        const Duration(milliseconds: 80), () {
                                      setState(() => isVisible = false);
                                    });
                                  });
                                });
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text("Yanlış birşeyler oldu"),
                                    );
                                  },
                                );
                              }
                              inputPro.clearControllers();
                            });
                          },
                          child: const Text("kaydet"))
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}

class BottomSheetTwo extends StatelessWidget {
  const BottomSheetTwo({
    super.key,
    required this.ref,
  });
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    var inputPro = ref.read(inputProvider);
    return SizedBox(
      width: context.deviceWidth / 2,
      child: Column(
        children: [
          CustomTextFormField(
              inpuType: TextInputType.number,
              title: "Kesim Ölçüsü",
              hintText: "1230",
              controller: inputPro.boyValue),
          CustomTextFormField(
              inpuType: TextInputType.number,
              title: "Kilo",
              hintText: "1200",
              controller: inputPro.kiloValue),
          CustomTextFormField(
              inpuType: TextInputType.number,
              maxL: 1,
              title: "adet",
              hintText: "adet",
              controller: inputPro.adet),
          CustomTextFormField(
              maxL: 1,
              title: "Açıklama",
              hintText: "açıklama",
              controller: inputPro.description),
        ],
      ),
    );
  }
}

class BottomSheetOne extends StatelessWidget {
  const BottomSheetOne({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    var inputPro = ref.read(inputProvider);
    return SizedBox(
        width: context.deviceWidth / 2,
        child: Column(
          children: [
            const DropDownItems(),
            CustomTextFormField(
                title: "Firma",
                hintText: "kutlu metal",
                controller: inputPro.firmaName),
            CustomTextFormField(
              inpuType: TextInputType.number,
              controller: inputPro.thicknessValue,
              hintText: "0.40",
              title: "Kalinlik",
            ),
            CustomTextFormField(
                inpuType: TextInputType.number,
                title: "En",
                hintText: "120",
                controller: inputPro.enValue)
          ],
        ));
  }
}
