//https://youtu.be/Mn254cnduOY?t=15392
//https://youtu.be/Mn254cnduOY?t=15120
import 'package:flutter/material.dart';
import 'package:login_bloc/constant/strings.dart' show enterYourPasswordHere;

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,

      obscureText: true,
      //obscuringCharacter: '*',
      decoration: const InputDecoration(
        hintText: enterYourPasswordHere,
      ),
    );
  }
}
