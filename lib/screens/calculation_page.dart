import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/extensions/get_size.dart';
import 'package:inventory_app/screens/calculations/calculate_weight.dart';
import 'package:inventory_app/screens/calculations/pvc_calculate.dart';

class CalculationPage extends ConsumerStatefulWidget {
  const CalculationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __CalculationPagStateState();
}

class __CalculationPagStateState extends ConsumerState<CalculationPage> {
  List<Widget> tabs = [const WeightCalculation(), const PvcAlanCalculatePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: GridView.builder(
            itemCount: tabs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: context.deviceHeight * 0.2,
            ),
            itemBuilder: (context, index) {
              return tabs[index];
            },
          ),
        ));
  }
}
