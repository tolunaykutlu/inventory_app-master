import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/extensions/get_size.dart';

class PvcAlanCalculatePage extends StatefulWidget {
  const PvcAlanCalculatePage({super.key});

  @override
  State<PvcAlanCalculatePage> createState() => _PvcAlanCalculatePageState();
}

class _PvcAlanCalculatePageState extends State<PvcAlanCalculatePage> {
  TextEditingController countController = TextEditingController();
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
                          "Metre kare hesabı",
                          style: AppConsts.syneMono(fSize: 25),
                        ),
                      ),
                      contentTextStyle: AppConsts.syneMono(),
                      content: SizedBox(
                        height: context.deviceHeight / 2,
                        child: Column(
                          children: [
                            CustomTextFormField(
                                title: "adet",
                                hintText: "0.40",
                                controller: countController),
                            CustomTextFormField(
                                title: "genişlik",
                                hintText: "1200",
                                controller: hCont),
                            CustomTextFormField(
                                title: "uzunluk",
                                hintText: "2500",
                                controller: tCont),
                            Center(
                              child: Text(maxLines: 4, "$sonuc metre kare "),
                            ),
                            ElevatedButton(
                                //TODO: hesaplama sayfasına başka hesaplamalar eklenecek
                                //internete bağlı olup olmadığımıza göre ekran
                                onPressed: () {
                                  setState(() {
                                    if (countController.text != "" &&
                                        hCont.text != "" &&
                                        tCont.text != "") {
                                      double res =
                                          double.parse(countController.text) *
                                              (double.parse(hCont.text) *
                                                  double.parse(tCont.text));
                                      sonuc = res * freeWeight;
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                content: Text(
                                                    "bütün alanları doldurun",
                                                    style:
                                                        AppConsts.syneMono()),
                                              ));
                                    }
                                  });
                                },
                                child: Text(
                                  "Hesapla",
                                  style: AppConsts.standartText(
                                      c: Colors.black, fSize: 20),
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
          "PVC metre kare hesabı",
          style: AppConsts.syneMono(c: Colors.white, fSize: 20),
        ));
  }
}
