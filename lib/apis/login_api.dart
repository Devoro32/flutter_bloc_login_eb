//https://youtu.be/Mn254cnduOY?t=9815

import 'package:flutter/foundation.dart' show immutable;
import 'package:login_bloc/models/models.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

// the '?' indicate that it may not bring in the login handle detail
  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

//https://youtu.be/Mn254cnduOY?t=10090
@immutable
class LoginApi implements LoginApiProtocol {
  //singleton pattern
  //! comment out due to the fact that it doesn't need to be an instance
  //!simple login function- https://youtu.be/Mn254cnduOY?t=16658
  // const LoginApi._sharedInstance();
  // static const LoginApi _shared = LoginApi._sharedInstance();
  // factory LoginApi.instance() => _shared;

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) =>
      //https://youtu.be/Mn254cnduOY?t=10384
      Future.delayed(
        const Duration(seconds: 2),
        () => email == 'foo@bar.com' && password == 'foobar',
      ).then((isLoggedIn) => isLoggedIn ? const LoginHandle.fooBar() : null);
}
