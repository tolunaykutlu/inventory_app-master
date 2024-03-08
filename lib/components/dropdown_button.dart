import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/app_constants.dart';

import 'package:inventory_app/providers/input_controllers.dart';
import 'package:inventory_app/extensions/get_size.dart';

class DropDownItems extends StatefulWidget {
  const DropDownItems({super.key});

  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  @override
  void dispose() {
    defValue;
    super.dispose();
  }

  final TextEditingController c = TextEditingController();

  final List<String> _items = [
    "430BA",
    "430SB",
    "4302B",
    "3042B",
    "304BA",
    "201",
    "GLVNZ",
    "ALİMİNYUM"
  ];
  String defValue = "430BA";
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
                hint: const Text("kalite"),
                style: AppConsts.getInstance().syneMono(),
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

                    ref.watch(inputProvider).qualityValue = defValue;
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
