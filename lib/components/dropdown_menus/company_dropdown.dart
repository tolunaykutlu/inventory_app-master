import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/app_constants.dart';

import 'package:inventory_app/providers/input_controllers.dart';
import 'package:inventory_app/extensions/get_size.dart';

class CompanyDropDownMenu extends StatefulWidget {
  const CompanyDropDownMenu({super.key});

  @override
  State<CompanyDropDownMenu> createState() => _CompanyDropDownMenuState();
}

class _CompanyDropDownMenuState extends State<CompanyDropDownMenu> {
  @override
  void dispose() {
    defValue;
    super.dispose();
  }

  final TextEditingController c = TextEditingController();

  final List<String> _items = [
    "KUTLU METAL",
    "ÇİMEN ÇELİK",
    "SIRAKAYA METAL",
    "PASA METAL",
    "DEM PASLANMAZ",
    "DSM GLVNZ",
    "CENGİZ SAC",
    "YİGİT PASLANMAZ",
    "KERİM METAL",
    "RESUL IRMAK"
  ];
  String defValue = "KUTLU METAL";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.deviceWidth / 2,
        decoration: BoxDecoration(border: Border.all(width: 2)),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DropdownButton<String>(
                menuMaxHeight: 300,
                hint: const Text("Firma"),
                style: AppConsts.syneMono(),
                value: defValue,
                items: _items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (yeniValue) {
                  setState(() {
                    defValue = yeniValue!;

                    ref.watch(inputProvider).firmaName.text = defValue;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
