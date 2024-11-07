// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/components/dropdown_menus/dropdown_button.dart';
import 'package:inventory_app/components/dropdown_menus/quality_ddown_menu.dart';
import 'package:inventory_app/components/horizontal_divider.dart';
import 'package:inventory_app/components/info__alert_page.dart';
import 'package:inventory_app/components/list_items.dart';
import 'package:inventory_app/components/page_header.dart';
import 'package:inventory_app/extensions/get_size.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';
import 'package:inventory_app/models/product_model.dart';
import 'package:inventory_app/providers/data_controllers.dart';
import 'package:inventory_app/providers/input_controllers.dart';

class PageThree extends ConsumerStatefulWidget {
  const PageThree({super.key});

  @override
  ConsumerState<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends ConsumerState<PageThree> {
  ProductModel productData = ProductModel();

  String selectedFilter = "430BA";

  @override
  Widget build(BuildContext context) {
    var filters = ref.read(inputProvider).filters;
    return Scaffold(
      body: SingleChildScrollView(
        //singleChileScrollView widgetini kullanarak klavye açıldığında headerı itmesini engelle
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: Column(
            children: [
              Header(
                headerText: "Stok Listesi",
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: Colors.white,
                          content: SizedBox(
                            height: context.deviceHeight * 0.50,
                            child: Column(
                              children: [
                                for (int i = 0; i < filters.length; i++)
                                  selectQualityFilter(filters, i),
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
              const HorizontalDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                    height: context.deviceHeight * 0.6,
                    child: StreamBuilder<List<ProductModel>>(
                      stream: ref
                          .read(firebaseProvider)
                          .getAllDocumentsStreamFromFirestore(selectedFilter),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          var incomingProducts =
                              ref.read(dataProvider).products;
                          incomingProducts = snapshot.data;

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: incomingProducts.length,
                            itemBuilder: (context, index) {
                              return listViewItems(
                                  incomingProducts, index, context);
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
                    )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 3),
                  onPressed: () {
                    inventoryProductAddSheet(context);
                  },
                  child: Text(
                    "Stok Ekle",
                    style: AppConsts.syneMono().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextButton selectQualityFilter(List<String> f, int i) {
    return TextButton(
      child: Text(
        f[i],
        style: AppConsts.standartText(),
      ),
      onPressed: () {
        setState(() {
          selectedFilter = f[i];
        });
      },
    );
  }

  Padding listViewItems(
      List<ProductModel> products, int index, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 3, bottom: 5, right: 3),
        child: GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return infoPage(products, index, context);
            },
          ),
          onLongPress: () {
            ref.read(firebaseProvider).deleteDocumentFromFirestore(
                  products[index].quality.toString(),
                  products[index].id.toString(),
                );
          },
          child: Container(
            height: context.deviceHeight > 750 ? 80 : 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              border:
                  Border.all(color: Colors.black.withOpacity(0.8), width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 7, right: 7),
              child: Row(
                children: [
                  ListItems(
                    item:
                        "${products[index].quality} x ${products[index].thickness!.toStringAsFixed(2)} x ${products[index].en} x ${products[index].boy}",
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<dynamic> inventoryProductAddSheet(BuildContext context) {
    bool isVisible = false;
    bool hasPvc = false;
    var inputPro = ref.read(inputProvider);

    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey[50],
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
                      TextButton(
                          onPressed: () {
                            setState(
                              () {
                                hasPvc = !hasPvc;
                              },
                            );
                          },
                          child: Text(
                            "PVC",
                            style: TextStyle(
                                color: hasPvc ? Colors.green : Colors.red),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (inputPro.qualityValue == "") {
                                inputPro.qualityValue = "430BA";
                                //kalite seçilmez ise default değer 430BA
                              }
                              if (inputPro.boyValue.text == "") {
                                inputPro.boyValue.text = "R";
                              }
                              if (inputPro.fiyatValue.text == "") {
                                inputPro.fiyatValue.text = "0";
                              }

                              productData = ProductModel(
                                  hasPvc: hasPvc,
                                  entryDate: DateTime.now(),
                                  quality: inputPro.qualityValue,
                                  thickness: double.parse(
                                      inputPro.thicknessValue.text),
                                  en: int.parse(inputPro.enValue.text),
                                  boy: inputPro.boyValue.text.toUpperCase(),
                                  kilo: inputPro.kiloValue.text,
                                  fiyat: inputPro.fiyatValue.text);

                              try {
                                ref //otomatik documentId ürün ekleme
                                    .read(firebaseProvider)
                                    .addProductToStokDb(
                                      inputPro.qualityValue,
                                      productData,
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
                                    return AlertDialog(
                                      title: Text(
                                          "Yanlış birşeyler oldu ${e.toString()}"),
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

class BottomSheetTwo extends StatefulWidget {
  const BottomSheetTwo({
    super.key,
    required this.ref,
  });
  final WidgetRef ref;

  @override
  State<BottomSheetTwo> createState() => _BottomSheetTwoState();
}

class _BottomSheetTwoState extends State<BottomSheetTwo> {
  @override
  Widget build(BuildContext context) {
    bool ruloPlaka = true;

    var inputPro = widget.ref.read(inputProvider);
    return SizedBox(
      width: context.deviceWidth / 2,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextFormField(
                    inpuType: TextInputType.number,
                    title: "Boy",
                    hintText: "1230",
                    controller: inputPro.boyValue),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  color: Colors.black,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          ruloPlaka = !ruloPlaka;
                        });
                      },
                      child: Text(
                        //TODO: rulo olunca R plaka olunca P olucak plaka olursa adet için ayrı bir alan olucak
                        ruloPlaka == true ? "R" : "P",
                        style: AppConsts.standartText(c: Colors.white),
                      )),
                ),
              ),
            ],
          ),
          CustomTextFormField(
              inpuType: TextInputType.number,
              title: "Kilo",
              hintText: "1200",
              controller: inputPro.kiloValue),
          CustomTextFormField(
              inpuType: TextInputType.number,
              title: "fiyat",
              hintText: "alış fiyatı",
              controller: inputPro.fiyatValue),
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
            const QualityDropDownMenu(),
            const ThicknessDropDownMenu(),
            CustomTextFormField(
                inpuType: TextInputType.number,
                title: "En",
                hintText: "120",
                controller: inputPro.enValue)
          ],
        ));
  }
}
