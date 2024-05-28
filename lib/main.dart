import 'package:flutter/material.dart';
import 'package:app/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Il metodo è quello di chimare nel main la Navbar, dal navbar.dart vengono richiamate le classi, dove a loro volta possono richiamare altre classi
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
} 