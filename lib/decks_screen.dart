import 'package:flash_cards_app/main.dart';
import 'package:flutter/material.dart';

class DecksScreen extends StatelessWidget {
  const DecksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false, // Sprječava vraćanje unazad
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DECKS'),
          automaticallyImplyLeading: false, // Uklanja back button
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
                          arguments: deck);
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
                Navigator.pushNamed(context, '/createDeck');
              },
              child: const Text('Add more'),
            ),
          ],
        ),
      ),
    );
  }
}
