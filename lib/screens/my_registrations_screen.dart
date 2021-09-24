import 'package:fallvilt/cubit/cubit.dart';
import 'package:fallvilt/models/registration_list_model.dart';
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.text_snippet),
                          ),
                          Text(getUtkastTekst(state))
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.send),
                          ),
                          Text(getOverforteTekst(state))
                        ],
                      ),
                    ),
                  ]),
                ),
                body: buildBody(state),
                bottomNavigationBar: buildBottomButtonBar(state));
          },
        ),
      ),
    );
  }

  Widget buildBottomButtonBar(RegistrationsState state) {
    if (state is RegistrationsLoaded) {
      return Container(
        height: 100,
        decoration: const BoxDecoration(border: Border(top: BorderSide())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF337E7D)))),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    shape: const BeveledRectangleBorder(),
                    primary: const Color(0xFFEBF3F3),
                    elevation: 0,
                  ),
                  onPressed: () => print(""),
                  child: const Icon(Icons.refresh, color: Color(0xFF337E7D))),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(270, 50), shape: const BeveledRectangleBorder(), elevation: 0),
                onPressed: () => print(""),
                child: Text(
                  "Overfør til hjorteviltregisteret (${state.registrations.utkast.where((element) => element.status.id == 0).length})",
                  style: const TextStyle(fontSize: 16),
                ))
          ],
        ),
      );
    } else {
      return Container(
        height: 100,
        decoration: const BoxDecoration(border: Border(top: BorderSide())),
        child: Row(
          children: [
            ElevatedButton(onPressed: () => print(""), child: const Icon(Icons.refresh)),
          ],
        ),
      );
    }
  }
}

Widget buildTableHeader() {
  return Container(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16, bottom: 8.0),
    decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
    child: Row(
      children: const [
        Expanded(
            flex: 2,
            child: Text(
              'Dato',
              style: TextStyle(fontSize: 20),
            )),
        Expanded(flex: 2, child: Text('Art', style: TextStyle(fontSize: 20))),
        Expanded(flex: 3, child: Text('Status', style: TextStyle(fontSize: 20))),
        Expanded(
          child: SizedBox(),
        ),
      ],
    ),
  );
}

Widget buildBody(RegistrationsState state) {
  if (state is RegistrationsLoaded) {
    return TabBarView(
      children: [
        Column(
          children: [
            buildTableHeader(),
            Expanded(
              child: ListView(
                children: List.generate(
                    state.registrations.utkast.length,
                    (i) => RegistrationListElementWidget(
                          id: state.registrations.utkast[i].id,
                          date: state.registrations.utkast[i].dato,
                          art: state.registrations.utkast[i].art,
                          status: state.registrations.utkast[i].status,
                        )),
              ),
            )
          ],
        ),
        Column(
          children: [
            buildTableHeader(),
            Expanded(
              child: ListView(
                children: List.generate(
                    state.registrations.overforte.length,
                    (i) => RegistrationListElementWidget(
                          id: state.registrations.overforte[i].id,
                          date: state.registrations.overforte[i].dato,
                          art: state.registrations.overforte[i].art,
                          status: state.registrations.overforte[i].status,
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
  final int id;
  final DateTime date;
  final String art;
  final RegistrationStatus status;

  const RegistrationListElementWidget(
      {Key? key, required this.id, required this.date, required this.art, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("hello $art nr $id"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Container(
          color: status.id == 0 || status.id == 3 ? Colors.green.shade50 : Colors.red.shade50,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text('${date.day}-${date.month}-${date.year}')),
                Expanded(flex: 2, child: Text(art)),
                Expanded(flex: 3, child: Text(status.label)),
                Expanded(
                    flex: 1,
                    child: Icon(
                      status.id == 3 ? Icons.arrow_forward_ios : Icons.edit_outlined,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
