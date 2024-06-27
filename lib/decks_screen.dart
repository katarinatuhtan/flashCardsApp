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
          title: const Text('DECKS'),
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
                      child: Center(
                        child: Text(deck['name']),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createDeck').then((_) {
                  setState(() {});
                });
              },
              child: const Text('Add more'),
            ),
          ],
        ),
      ),
    );
  }
}

