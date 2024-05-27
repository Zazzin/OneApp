import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // GNav
// Collegamenti con altri file e quidi poi con altri widget 
import 'home.dart';
import 'inventory.dart';
import 'search.dart';
import 'settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, Key? keyAlter});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PageController _controlloPagina;
  int _paginaSelezionata = 0; // Serve per cambiare le pagine dalla navbar

  @override
  void initState() {
    super.initState();
    _controlloPagina = PageController(initialPage: _paginaSelezionata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: _controlloPagina,
        onPageChanged: (index) { // Impostare lo stato della pagina
          setState(() { // Qualcosa deve variare
            _paginaSelezionata = index;
          });
        },

        children: const [ // Qui c'è il collegamento alle altre pagine
          HomeScreen(),
          InventoryScreen(),
          SearchScreen(),
          SettingsScreen(),
        ],

      ),
      bottomNavigationBar: Container(

        color: const Color.fromARGB(0, 0, 74, 74), // Tutta la navbar di colore nero

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20), // È il posizionamento della navbar 

          child: GNav(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            color: const Color.fromARGB(255, 121, 148, 150), // Colore dei pulsanti della nav bar
            activeColor: const Color.fromARGB(255, 121, 148, 150),
            tabBackgroundColor: const Color.fromARGB(38, 0, 0, 0), // Lo sfondo del pulsante della navbar
            gap: 8, // È lo spazio tra l'icona e la scritta
            padding: const EdgeInsets.all(16),

            tabs: const [
              GButton(
                icon: Icons.home_outlined, // Icona della home
                text: 'Home',
              ),
              GButton(
                icon: Icons.inventory_2_outlined, // Icona della inventario
                text: 'Storage',
              ),
              GButton(
                icon: Icons.search, // Icona della ricerca
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings_suggest_outlined, // // Icona delle impostazioni
                text: 'Impostazioni',
              ),
            ],

            selectedIndex: _paginaSelezionata, // Serve per cambiare la pagina della navbar
            onTabChange: (index) { // animazione usata per il cambio della pagina
              _controlloPagina.animateToPage(
                index,
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ),
    );
  }

@override // Questa parte serve per il cambiamento della pagina, ma anche per la "pulizia di memoria" prima rilasciata
  void dispose() {
    _controlloPagina.dispose();
    super.dispose();
  }
}