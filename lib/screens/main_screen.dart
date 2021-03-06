import 'package:fallvilt/cubit/cubit.dart';
import 'package:fallvilt/repositories/authentication_repository_fake.dart';
import 'package:fallvilt/screens/my_registrations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ola Nordmann"), actions: [
        IconButton(
          onPressed: () => print("go to profile"),
          icon: const Icon(Icons.person, color: Colors.white),
        ),
      ]),
      body: BlocProvider(
        create: (context) => StatsCubit(AuthenticationRepositoryFake())..loadStats(),
        child: BlocBuilder<StatsCubit, StatsState>(
          builder: (context, state) {
            if (state is StatsInitial) {
              return buildInitial();
            } else if (state is StatsLoaded) {
              return buildButtonColumn(context, state.stats.antallUtkast, state.stats.antallOverforte);
            } else {
              return buildButtonColumn(context, 0, 0);
            }
          },
        ),
      ),
    );
  }

  Widget buildInitial() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildButton(VoidCallback onPressed, IconData iconData, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
        onPressed: onPressed,
        icon: Icon(iconData),
        label: Text(label),
      ),
    );
  }

  Widget buildButtonColumn(BuildContext context, int antallUtkast, int antallOverforte) {
    var utkastTekst = antallUtkast == 0 ? "Gå til utkast" : "Gå til utkast ($antallUtkast)";
    var overforteTekst = antallOverforte == 0 ? "Gå til utkast" : "Gå til utkast ($antallOverforte)";

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Column(
              children: const [
                Image(image: AssetImage('assets/icons/fallvilt.png')),
                Text(
                  "Fallvilt",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(() => print("NY"), Icons.add, "Ny registrering"),
                buildButton(() => Navigator.push(context, MyRegistrationsScreen.route(MyRegistrationsScreen.utkastTab)),
                    Icons.text_snippet, utkastTekst),
                buildButton(
                    () => Navigator.push(context, MyRegistrationsScreen.route(MyRegistrationsScreen.overforteTab)),
                    Icons.send,
                    overforteTekst),
              ],
            ),
          )
        ],
      ),
    );
  }
}
