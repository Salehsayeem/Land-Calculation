import 'dart:math';
import 'package:flutter/material.dart';
import 'package:land_calculation/screen/landing_page.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Rectangle")),
        body: const RectangleCalculation(),
      ),
    );
  }
}

class RectangleCalculation extends StatefulWidget {
  const RectangleCalculation({Key? key}) : super(key: key);

  @override
  State<RectangleCalculation> createState() => _RectangleCalculationState();
}

class _RectangleCalculationState extends State<RectangleCalculation> {
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller =  TextEditingController();
  TextEditingController num3controller =  TextEditingController();
  TextEditingController num4controller =  TextEditingController();

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
                  border: OutlineInputBorder(),
                  hintText: 'Enter 1st value',
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
        Row(
          children: [
            const Text("Number 4: "),
            // ignore: unnecessary_new
            new Flexible(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num4controller,
                decoration: const InputDecoration(
                  hintText: 'Enter 4th value',
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
                      num3controller.text != "" ||
                      num4controller.text != "") {
                    double n1 = double.parse(num1controller.text);
                    double n2 = double.parse(num2controller.text);
                    double n3 = double.parse(num3controller.text);
                    double n4 = double.parse(num4controller.text);

                    double sqrfoot = n1 * n2 * n3 * n4;

                    squareFoot = sqrt(sqrfoot);
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
              child: const Text("Clear", style: TextStyle(fontSize: 30)),
              onPressed: () {
                setState(() {
                  num1controller.text = "";
                  num2controller.text = "";
                  num3controller.text = "";
                  num4controller.text = "";
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
