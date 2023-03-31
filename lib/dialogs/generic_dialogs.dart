//https://youtu.be/Mn254cnduOY?t=12341
import 'package:flutter/material.dart';

//T-> generic, this is equal to map of string and optional T
typedef DialogOptionBuilder<T> = Map<String, T?> Function();

// a dialog on android can be dismissed without hitting the button,hence the <T?>, the ? is optional

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionBuilder,
}) {
  //https://youtu.be/Mn254cnduOY?t=12760
  final options = optionBuilder();
  //why we need the <T?> : https://youtu.be/Mn254cnduOY?t=12999
  return showDialog<T?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        //https://youtu.be/Mn254cnduOY?t=12808
        actions: options.keys.map(
          (optionTitle) {
            final value = options[optionTitle];
            return TextButton(
              onPressed: () {
                if (value != null) {
                  Navigator.of(context).pop(value);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(optionTitle),
            );
          },
        ).toList(),
      );
    },
  );
}
