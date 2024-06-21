import 'package:flutter/material.dart';
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

bool isMatched() {
  bool matched = false;
  if (passwordController.text != "" &&
      rPasswordController.text != "" &&
      passwordController.text == rPasswordController.text) {
    matched = true;
    return matched;
  } else {
    matched = false;
    return matched;
  }
}

class _SignInPageViewState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go("/Login"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              CustomTextFormField(
                  secret: true,
                  title: "Şifre Tekrarı",
                  hintText: "qwe123",
                  controller: rPasswordController),
              Visibility(
                visible: isMatched(),
                child: Text(
                  "Şifreler aynı olmalıdır!!",
                  style: AppConsts.syneMono(c: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        if (EmailValidator.isValid(emailController.text) &&
                            isMatched() == true) {
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
                                          context.go("/Login");
                                        });
                                      },
                                      icon:
                                          const Icon(Icons.arrow_back_outlined),
                                      label: const Text("Girişe Dön")),
                                );
                              },
                            );
                          }).onError((error, stackTrace) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(error.toString()),
                                );
                              },
                            );
                          });
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("Email yada şifreyi yanlış girdiniz"),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      "Kayıt ol",
                      style: AppConsts.syneMono(),
                    )),
              )
            ],
          ),
        ));
  }
}
