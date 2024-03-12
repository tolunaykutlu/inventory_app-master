import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.item,
  });
  final String item;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        child: Text(
          item,
          style: AppConsts.syneMono(),
        ),
      ),
    );
  }
}
