import 'package:flutter/material.dart';
import 'package:space_app/explore.dart';
import 'package:space_app/home.dart';
import 'package:space_app/planetDescription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home",
      routes: {
        "explore": (context) => const Explore(),
        "home": (context) => const Home(),
      },
    );
  }
}