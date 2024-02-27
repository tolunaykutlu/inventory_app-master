import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/firebase/firebase_auth.dart';
import 'package:inventory_app/helpers/regex.dart';

class LoginPageView extends ConsumerStatefulWidget {
  const LoginPageView({super.key});

  @override
  ConsumerState<LoginPageView> createState() => _LoginPageViewState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageViewState extends ConsumerState<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  title: "E-mail",
                  hintText: "asdwe@gmail.com",
                  controller: emailController),
              CustomTextFormField(
                  secret: true,
                  title: "Şifre",
                  hintText: "qwe123",
                  controller: passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Şifremi Unuttum?",
                      style: AppConsts.getInstance().syneMono(),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.go("/Sign");
                      },
                      child: Text(
                        "Kayıt ol",
                        style: AppConsts.getInstance().syneMono(c: Colors.red),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      if (EmailValidator.isValid(emailController.text) &&
                          passwordController.text != "") {
                        ref
                            .read(authProvider)
                            .signInWithEmailAndPassword(
                                emailController.text, passwordController.text)
                            .then((value) => context.go("/mainPage"));
                      }
                    },
                    child: Text(
                      "Giriş Yap",
                      style: AppConsts.getInstance().syneMono(),
                    )),
              )
            ],
          ),
        ));
  }
}
