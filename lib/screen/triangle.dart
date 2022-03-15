import 'dart:math';
import 'package:flutter/material.dart';

import 'landing_page.dart';

class Triangle extends StatelessWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Triangle")),
        body: const TriangleCalculation(),
      ),
    );
  }
}

class TriangleCalculation extends StatefulWidget {
  const TriangleCalculation({Key? key}) : super(key: key);

  @override
  State<TriangleCalculation> createState() => _TriangleCalculationState();
}

class _TriangleCalculationState extends State<TriangleCalculation> {
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  TextEditingController num3controller = TextEditingController();

  double s = 0.00;
  double squareFoot = 0.00;
  double shotangsho = 0.00;
  double katha = 0.00;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            const Text("Number 1: "),
            // ignore: unnecessary_new
            new Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num1controller,
                decoration: const InputDecoration(
                  hintText: 'Enter 1st value',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            const Text("Number 2: "),
            // ignore: unnecessary_new
            new Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num2controller,
                decoration: const InputDecoration(
                  hintText: 'Enter 2nd value',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            const Text("Number 3: "),
            // ignore: unnecessary_new
            new Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num3controller,
                decoration: const InputDecoration(
                  hintText: 'Enter 3rd value',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Calculate", style: TextStyle(fontSize: 30)),
              onPressed: () {
                setState(() {
                  if (num1controller.text != "" ||
                      num2controller.text != "" ||
                      num3controller.text != "") {
                    double n1 = double.parse(num1controller.text);
                    double n2 = double.parse(num2controller.text);
                    double n3 = double.parse(num3controller.text);
                    s = (n1 + n2 + n3) / 2;

//=SQRT(s*(s-1)*(s-2)*(s-3))
//=F9/  435.6
                    squareFoot = sqrt(s * (s - n1) * (s - n2) * (s - n3));
                    shotangsho = squareFoot / 435.6;
                    katha = shotangsho / 1.65;
                  } else {
                    const AlertDialog(
                      title: Text("Error"),
                      content: Text("Input fields must have value"),
                    );
                  }
                });
              },
            ),
            const SizedBox(width: 5),
            ElevatedButton(
              child: const Text(
                "Clear",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                setState(() {
                  num1controller.text = "";
                  num2controller.text = "";
                  num3controller.text = "";
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "S: ",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Text(
              s.toStringAsFixed(4),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Square foot:",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Text(
              squareFoot.toStringAsFixed(4),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Percentage:",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Text(
              shotangsho.toStringAsFixed(4),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Katha:",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Text(
              katha.toStringAsFixed(4),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50, width: 5),
        ElevatedButton(
          child:
              const Text("Back to Main Page", style: TextStyle(fontSize: 30)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LandingPage()),
            );
          },
        ),
      ],
    );
  }
}
