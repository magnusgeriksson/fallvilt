import 'package:flutter/material.dart';

class MyRegistrationsScreen extends StatelessWidget {
  const MyRegistrationsScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MyRegistrationsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mine registreringer"),
        bottom: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.text_snippet),
            text: "Utkast",
          ),
          Tab(
            icon: Icon(Icons.send),
            text: "Overførte",
          )
        ]),
      ),
      body: Column(
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
      bottomNavigationBar: Row(
        children: [IconButton(onPressed: () => print(""), icon: const Icon(Icons.refresh))],
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
