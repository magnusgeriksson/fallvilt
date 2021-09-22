import 'package:flutter/material.dart';

class MyRegistrationsScreen extends StatelessWidget {
  final int initialIndex;
  const MyRegistrationsScreen({Key? key, required this.initialIndex}) : super(key: key);

  static Route route(int initialIndex) {
    return MaterialPageRoute<void>(
        builder: (_) => MyRegistrationsScreen(
              initialIndex: initialIndex,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mine registreringer"),
          bottom: TabBar(labelColor: Colors.green, unselectedLabelColor: Colors.grey.shade100, tabs: [
            Tab(
              child: Row(
                children: [Icon(Icons.text_snippet), Text("Utkast")],
              ),
            ),
            Tab(
              child: Row(
                children: [Icon(Icons.send), Text("Overførte")],
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Row(
                  children: [Text("Utkast"), Text("Overførte")],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                      RegistrationListElement(date: DateTime.now(), art: "Elg", status: "Mangler info"),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [Text("Utkast"), Text("Overførte")],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      RegistrationListElement(date: DateTime.now(), art: "Villrein", status: "overført"),
                      RegistrationListElement(date: DateTime.now(), art: "Villrein", status: "overført"),
                      RegistrationListElement(date: DateTime.now(), art: "Villrein", status: "overført"),
                      RegistrationListElement(date: DateTime.now(), art: "Villrein", status: "overført"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: Row(
          children: [IconButton(onPressed: () => print(""), icon: const Icon(Icons.refresh))],
        ),
      ),
    );
  }
}

class RegistrationListElement extends StatelessWidget {
  final DateTime date;
  final String art;
  final String status;

  const RegistrationListElement({Key? key, required this.date, required this.art, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text('${date.day}-${date.month}-${date.year}'), Text(art), Text(status)],
    );
  }
}