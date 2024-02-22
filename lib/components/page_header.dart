// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//header
class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.headerText,
    required this.onpress,
  }) : super(key: key);
  final String headerText;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
            onPressed: onpress,
            icon: const Icon(
              Icons.menu_sharp,
            ))
      ],
    );
  }
}

//horizontal line
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
