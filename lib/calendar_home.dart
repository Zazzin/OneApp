import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart'; // Calendario
import 'package:intl/date_symbol_data_local.dart'; // Calendario in versione italiana 

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarPageState createState() => _CalendarPageState();
}

// Il "giornoColorato" è il giorno che varrà anche selezionato ma che è anche quello del giorno corrente 

class _CalendarPageState extends State<CalendarPage> {
  final CalendarFormat _formatoCalendario = CalendarFormat.month;
  DateTime _giornoColorato = DateTime.now();
  DateTime? _giornoSelezionato;

  // Mettere il calendario in versione italiana
  /*@override
  void initState() {
    super.initState();
    initializeDateFormatting('it_IT', null);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned( // La posizione del calendario
            top: 120,   
            left: 16,  
            right: 16, 

            child: Column(
              children: [
                Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello!', // Il tuo testo qui
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold), // Stile del testo
                ),
              ),
                TableCalendar(
              //locale: 'it_IT', // Mettere la versione italiana 
              firstDay: DateTime.utc(2010, 10, 16), // Data da cui inizia il calendario
              lastDay: DateTime.utc(2030, 3, 14), // Data in cui finisce il calendario

              focusedDay: _giornoColorato,
              calendarFormat: _formatoCalendario,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month', // Mostra mese
                CalendarFormat.week: 'Week', // Mostra settimana
                },  

              selectedDayPredicate: (day) { // Colora di base il giorno che viene selezionato
                return isSameDay(_giornoSelezionato, day);
              },

              onDaySelected: (giornoSelezionato, giornoColorato) { 
                setState(() { // Il getState serve per dire che qualcosa deve essere cambiato
                  _giornoSelezionato = giornoSelezionato; // Aggiorna 
                  _giornoColorato = giornoColorato; // Aggiorna 
                });
              },

              onPageChanged: (giornoColorato) { // Usato per mantenere il giorno selezionato anche quando si cambia la pagina 
                _giornoColorato = giornoColorato; // Mantieni giorno
              },

              calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue, // Cambia il colore qui
                shape: BoxShape.circle,
              ),
            ),
                ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}