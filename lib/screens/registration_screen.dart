import 'package:fallvilt/bloc/registration/registration_bloc.dart';
import 'package:fallvilt/repositories/repositories.dart';
import 'package:fallvilt/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RegistrationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return RegistrationBloc(registrationRepository: RepositoryProvider.of<IRegistrationRepository>(context));
          },
          child: const RegistrationForm(),
        ),
      ),
    );
  }
}
