// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:inventory_app/components/app_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
            style: AppConsts.getInstance().syneMono,
            decoration: InputDecoration(
              hintText: hintText,
              labelStyle: AppConsts.getInstance().syneMono,
              label: Text(title),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black)),
            ),
            controller: controller),
      ),
    );
  }
}
