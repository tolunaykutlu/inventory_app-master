import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      endIndent: 0,
      thickness: 3,
      color: Colors.black,
      height: 2,
      indent: 0,
    );
  }
}
