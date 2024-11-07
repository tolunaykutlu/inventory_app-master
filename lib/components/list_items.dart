import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/extensions/get_size.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.item,
    this.flexx = 1,
  });
  final String item;
  final int flexx;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexx,
      child: SizedBox(
        child: Text(
          item,
          style: AppConsts.standartText(
              fSize: context.deviceWidth > 500 ? 25 : 15),
        ),
      ),
    );
  }
}
