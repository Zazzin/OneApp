import 'package:flutter/material.dart';
import 'calendar_home.dart';

// Pagina iniziale con cui si deve aprire il programma
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
        children: [

          Positioned( // Posizione della scritta di saluto
            left: 30,
            top: 10, // Cambia questo valore per spostare il testo su o giù
            child: Text(
              'Benvenuto!', // Il tuo testo qui
              style: TextStyle(fontSize: 30), // Stile del testo
            ),
          ),

          Positioned( // Posizione della scritta calendario
            left: 30,
            top: 140,
            child: Text(
              'Calendario',
              style: TextStyle(fontSize: 30), // Stile del testo
            ),
          ),

          Positioned(
            child: Expanded( // Aggiungere un collegamento
              child: CalendarPage(), // Collegameto al calendario
            ),
          ),
          
        ],
      );
  }
}