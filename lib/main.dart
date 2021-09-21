import 'package:fallvilt/repositories/repositories.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
