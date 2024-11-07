import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/app_constants.dart';

import 'package:inventory_app/providers/input_controllers.dart';
import 'package:inventory_app/extensions/get_size.dart';

class ThicknessDropDownMenu extends StatefulWidget {
  const ThicknessDropDownMenu({super.key});

  @override
  State<ThicknessDropDownMenu> createState() => _ThicknessDropDownMenuState();
}

class _ThicknessDropDownMenuState extends State<ThicknessDropDownMenu> {
  @override
  void dispose() {
    defValue;
    super.dispose();
  }

  final TextEditingController c = TextEditingController();

  final List<String> _items = [
    "0.15",
    "0.20",
    "0.25",
    "0.30",
    "0.35",
    "0.40",
    "0.45",
    "0.50",
    "0.55",
    "0.60",
    "0.70",
    "0.80",
    "0.90",
    "1.00",
    "1.10",
    "1.20",
    "1.30",
    "1.40",
    "1.50",
    "1.60",
    "1.70",
    "1.80",
    "1.90",
    "2.00",
    "2.20",
    "2.30",
    "2.40",
    "2.50",
    "3.00",
  ];
  String defValue = "0.50";
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
                hint: const Text("kalinlik"),
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

                    ref.watch(inputProvider).thicknessValue.text = defValue;
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
