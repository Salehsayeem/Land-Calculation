import 'package:flutter/material.dart';
import 'package:land_calculation/screen/rectangle.dart';
import 'package:land_calculation/screen/triangle.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Land calculation ")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Rectangle", style: TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rectangle()),
                );
              },
            ),
            const SizedBox(width: 5),
            ElevatedButton(
              child: const Text("Triangle", style: TextStyle(fontSize: 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Triangle()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
