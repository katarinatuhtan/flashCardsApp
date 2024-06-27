import 'package:flash_cards_app/main.dart';
import 'package:flutter/material.dart';

class DecksScreen extends StatefulWidget {
  const DecksScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DecksScreenState createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false, // Sprečava vraćanje unazad
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'YOUR DECKS',
            style: TextStyle(
              color: Color.fromARGB(255, 18, 7, 39), // Crna boja za naslov
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false, // Uklanja back dugme
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: decks.length,
                itemBuilder: (context, index) {
                  final deck = decks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/deckDetail',
                              arguments: deck)
                          .then((result) {
                        if (result == true) {
                          setState(() {});
                        }
                      });
                    },
                    child: Card(
                      color: const Color.fromRGBO(
                          98, 0, 234, 0.8), // Ljubičasta boja pozadine deka
                      child: Center(
                        child: Text(
                          deck['name'],
                          style: const TextStyle(
                            color: Colors.white, // Bijeli tekst
                            fontWeight: FontWeight.bold, // Boldan font
                            fontSize: 18, // Veličina fonta
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20), // Razmak između grida i dugmeta
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createDeck').then((_) {
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16, // Povećava visinu dugmeta
                    horizontal: 32, // Povećava širinu dugmeta
                  ),
                ),
                child: const Text(
                  'Add more',
                  style: TextStyle(
                    fontSize: 18, // Veličina fonta
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
