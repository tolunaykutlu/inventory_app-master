import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/custom_textform.dart';
import 'package:inventory_app/firebase/firebase_auth.dart';
import 'package:inventory_app/helpers/regex.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageViewState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController rPasswordController = TextEditingController();

class _SignInPageViewState extends ConsumerState<SignInPage> {
  bool isPwSecret = true;

  bool isVisible() {
    if (passwordController.text == rPasswordController.text) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextFormField(
                  title: "E-mail",
                  hintText: "asdwe@gmail.com",
                  controller: emailController),
              CustomTextFormField(
                  icon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPwSecret = !isPwSecret;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: isPwSecret ? Colors.red : Colors.green,
                      )),
                  secret: isPwSecret,
                  title: "Şifre",
                  hintText: "qwe123",
                  controller: passwordController),
              CustomTextFormField(
                  secret: isPwSecret,
                  title: "Şifre Tekrarı",
                  hintText: "qwe123",
                  controller: rPasswordController),
              Visibility(
                visible: isVisible(),
                child: Text(
                  "Şifreler aynı olmalıdır!!",
                  style: AppConsts.getInstance().syneMono,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        if (EmailValidator.isValid(emailController.text) &&
                            isVisible() == false) {
                          ref
                              .read(authProvider)
                              .createAccount(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: const BeveledRectangleBorder(),
                                  backgroundColor: Colors.white,
                                  title: const Text("Kayıt başarılı"),
                                  content: ElevatedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          context.go("/");
                                        });
                                      },
                                      icon:
                                          const Icon(Icons.arrow_back_outlined),
                                      label: const Text("Girişe Dön")),
                                );
                              },
                            );
                          });
                        }
                      });
                    },
                    child: Text(
                      "Kayıt ol",
                      style: AppConsts.getInstance().syneMono,
                    )),
              )
            ],
          ),
        ));
  }
}
