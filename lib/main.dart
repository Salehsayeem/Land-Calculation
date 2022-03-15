import 'package:flutter/material.dart';
import 'package:land_calculation/screen/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Land Calculation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const LandingPage(),
    );
  }
}
