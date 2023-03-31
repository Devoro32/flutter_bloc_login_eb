//https://youtu.be/Mn254cnduOY?t=15777

import 'package:flutter/material.dart';
import 'package:login_bloc/constant/strings.dart';
import 'package:login_bloc/dialogs/generic_dialogs.dart';

typedef OnLoginTapped = void Function(
  String email,
  String password,
);

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTapped onLoginTapped;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTapped,
  });

  @override
  Widget build(BuildContext context) {
    //https://youtu.be/Mn254cnduOY?t=15921
    return TextButton(
      onPressed: () {
        final email = emailController.text;
        final password = passwordController.text;
        if (email.isEmpty || password.isEmpty) {
          showGenericDialog(
            context: context,
            title: emailOrPasswordEmptyDialogTitle,
            content: emailOrPasswordEmptyDescription,
            optionBuilder: () => {ok: true},
          );
        } else {
          onLoginTapped(
            email,
            password,
          );
        }
      },
      child: const Text(login),
    );
  }
}
