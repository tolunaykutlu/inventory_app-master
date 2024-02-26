import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';

class WeightCalculation extends StatefulWidget {
  const WeightCalculation({super.key});

  @override
  State<WeightCalculation> createState() => _WeightCalculationState();
}

class _WeightCalculationState extends State<WeightCalculation> {
  TextEditingController wCont = TextEditingController();
  TextEditingController hCont = TextEditingController();
  TextEditingController tCont = TextEditingController();
  double freeWeight = 7.85;
  double sonuc = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                      title: const Text("Weight Calculator"),
                      contentTextStyle: AppConsts.getInstance().syneMono(),
                      content: Column(
                        children: [
                          CustomTextFormField(
                              title: "kalınlık",
                              hintText: "0.40",
                              controller: tCont),
                          CustomTextFormField(
                              title: "genişlik",
                              hintText: "1200",
                              controller: wCont),
                          CustomTextFormField(
                              title: "uzunluk",
                              hintText: "2500",
                              controller: hCont),
                          Text("Adet kilo değeri ---- $sonuc"),
                          TextButton(
                              //TODO: hesaplama sayfasına başka hesaplamalar eklenecek
                              onPressed: () {
                                setState(() {
                                  double res = double.parse(wCont.text) *
                                      double.parse(hCont.text) *
                                      double.parse(tCont.text);
                                  sonuc = res * freeWeight;
                                });
                              },
                              child: const Text("Hesapla"))
                        ],
                      ));
                },
              );
            },
          );
        },
        child: const Text("Ağırlık Hesaplama"));
  }
}
