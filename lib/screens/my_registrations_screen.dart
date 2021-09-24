import 'package:fallvilt/cubit/cubit.dart';
import 'package:fallvilt/repositories/registration_repository_fake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRegistrationsScreen extends StatelessWidget {
  final int initialIndex;
  const MyRegistrationsScreen({Key? key, required this.initialIndex}) : super(key: key);

  static int utkastTab = 0;
  static int overforteTab = 1;

  static Route route(int initialIndex) {
    return MaterialPageRoute<void>(
        builder: (_) => MyRegistrationsScreen(
              initialIndex: initialIndex,
            ));
  }

  String getUtkastTekst(RegistrationsState state) {
    if (state is RegistrationsLoaded) return "Utkast (${state.registrations.utkast.length})";
    return "Utkast";
  }

  String getOverforteTekst(RegistrationsState state) {
    if (state is RegistrationsLoaded) return "Overførte (${state.registrations.overforte.length})";
    return "Overførte";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      child: BlocProvider(
        create: (context) => RegistrationsCubit(RegistrationRepositoryFake())..loadRegistrations(),
        child: BlocBuilder<RegistrationsCubit, RegistrationsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Mine registreringer"),
                bottom: TabBar(tabs: [
                  Tab(
                    child: Row(
                      children: [const Icon(Icons.text_snippet), Text(getUtkastTekst(state))],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [const Icon(Icons.send), Text(getOverforteTekst(state))],
                    ),
                  ),
                ]),
              ),
              body: buildBody(state),
              bottomNavigationBar: Row(
                children: [IconButton(onPressed: () => print(""), icon: const Icon(Icons.refresh))],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget buildBody(RegistrationsState state) {
  if (state is RegistrationsLoaded) {
    return TabBarView(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(
                    state.registrations.utkast.length,
                    (i) => RegistrationListElementWidget(
                          date: state.registrations.utkast[i].dato,
                          art: state.registrations.utkast[i].art,
                          status: state.registrations.utkast[i].status.label,
                        )),
              ),
            )
          ],
        ),
        Column(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(
                    state.registrations.overforte.length,
                    (i) => RegistrationListElementWidget(
                          date: state.registrations.overforte[i].dato,
                          art: state.registrations.overforte[i].art,
                          status: state.registrations.overforte[i].status.label,
                        )),
              ),
            )
          ],
        ),
      ],
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class RegistrationListElementWidget extends StatelessWidget {
  final DateTime date;
  final String art;
  final String status;

  const RegistrationListElementWidget({Key? key, required this.date, required this.art, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text('${date.day}-${date.month}-${date.year}'), Text(art), Text(status)],
    );
  }
}
