import 'package:flutter/material.dart';
import 'package:app/navbar.dart';

void main() {
  runApp(const MyApp());
}

class QuadratoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quadrato in Flutter'),
        ),
        body: Center(
          child: Quadrato(),
        ),
      ),
    );
  }
}

class Quadrato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0, // Larghezza del quadrato
      height: 100.0, // Altezza del quadrato
      color: Colors.blue, // Colore del quadrato
    );
  }
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