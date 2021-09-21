import 'package:bloc/bloc.dart';
import 'package:fallvilt/repositories/repositories.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'bloc/registration/registration_observer.dart';

void main() {
  Bloc.observer = RegistrationObserver();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
