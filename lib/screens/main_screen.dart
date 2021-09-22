import 'package:fallvilt/screens/my_registrations_screen.dart';
import 'package:flutter/material.dart';

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
      body: Center(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
                      onPressed: () => print("Ny"),
                      icon: const Icon(Icons.add),
                      label: const Text("Ny registrering"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
                        onPressed: () => Navigator.push(context, MyRegistrationsScreen.route(0)),
                        icon: const Icon(Icons.text_snippet),
                        label: const Text("Gå til utkast")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
                      onPressed: () => Navigator.push(context, MyRegistrationsScreen.route(1)),
                      icon: const Icon(Icons.send),
                      label: const Text("Gå til overførte"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
