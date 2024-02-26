import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationPage extends ConsumerStatefulWidget {
  const CalculationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __CalculationPagStateState();
}

class __CalculationPagStateState extends ConsumerState<CalculationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Hesaplama"),
      ),
    );
  }
}
