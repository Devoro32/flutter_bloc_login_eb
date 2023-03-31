//https://youtu.be/Mn254cnduOY?t=13179
import 'package:flutter/foundation.dart' show immutable;

// this is just a token: https://youtu.be/Mn254cnduOY?t=13425
typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;
  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
