// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:inventory_app/components/app_constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    this.secret = false,
    required this.hintText,
    required this.controller,
    this.customValitador,
    this.icon,
    this.errText,
    this.maxL = 1,
    this.inpuType = TextInputType.text,
  });

  final String? Function(String?)? customValitador;
  final String title;
  final bool secret;
  final String hintText;
  final TextEditingController controller;
  final Widget? icon;
  final String? errText;
  final int maxL;
  final TextInputType inpuType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPwSecret = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
            keyboardType: widget.inpuType,
            textInputAction: TextInputAction.next,
            maxLines: widget.maxL,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.customValitador,
            obscureText: widget.secret == true ? isPwSecret : false,
            obscuringCharacter: "*",
            style: AppConsts.syneMono(),
            decoration: InputDecoration(
              errorText: widget.errText,
              suffixIcon: widget.secret == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPwSecret = !isPwSecret;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: isPwSecret ? Colors.red : Colors.green,
                      ))
                  : null,
              suffix: widget.icon,
              hintText: widget.hintText,
              labelStyle: AppConsts.syneMono(),
              label: Text(widget.title),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black)),
            ),
            controller: widget.controller),
      ),
    );
  }
}
