import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/extensions/get_size.dart';

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
                      shadowColor: Colors.white,
                      backgroundColor: Colors.white,
                      title: Center(
                        child: Text(
                          "Adet kilo hesabı",
                          style: AppConsts.getInstance().syneMono(fSize: 25),
                        ),
                      ),
                      contentTextStyle: AppConsts.getInstance().syneMono(),
                      content: SizedBox(
                        height: context.deviceHeight / 2,
                        child: Column(
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
                            Center(
                              child: Text(
                                  maxLines: 4,
                                  "1 Adet ${tCont.text} x ${wCont.text} x ${hCont.text} çelik kilo değeri  $sonuc"),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (wCont.text != "" &&
                                        hCont.text != "" &&
                                        tCont.text != "") {
                                      double res = double.parse(wCont.text) *
                                          double.parse(hCont.text) *
                                          double.parse(tCont.text);
                                      sonuc = res * freeWeight;
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                content: Text(
                                                    "bütün alanları doldurun",
                                                    style:
                                                        AppConsts.getInstance()
                                                            .syneMono()),
                                              ));
                                    }
                                  });
                                },
                                child: Text(
                                  "Hesapla",
                                  style: AppConsts.getInstance()
                                      .standartText(c: Colors.black, fSize: 20),
                                ))
                          ],
                        ),
                      ));
                },
              );
            },
          );
        },
        child: Text(
          "Ağırlık Hesaplama",
          style: AppConsts.getInstance().syneMono(fSize: 20),
        ));
  }
}
