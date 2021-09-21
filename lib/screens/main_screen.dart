import 'package:fallvilt/widgets/widgets.dart';
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
            const Image(image: AssetImage('assets/icons/fallvilt.png')),
            const Text(
              "Fallvilt",
              style: TextStyle(fontSize: 30),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
                    onPressed: () => print("Ny"),
                    icon: Icon(Icons.add),
                    label: Text("Ny registrering"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
                      onPressed: () => print("Ny"),
                      icon: Icon(Icons.text_snippet),
                      label: Text("Gå til utkast")),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 50), shape: const BeveledRectangleBorder()),
                    onPressed: () => print("Ny"),
                    icon: Icon(Icons.send),
                    label: Text("Gå til overførte"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
