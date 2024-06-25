import 'package:flash_cards_app/main.dart';
import 'package:flutter/material.dart';

class DeckDetailScreen extends StatelessWidget {
  const DeckDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> deck =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(deck['name']),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createDeck', arguments: deck);
              },
              child: const Text('Add more'),
            ),
            ElevatedButton(
              onPressed: () {
                decks.remove(deck);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Deck deleted successfully')),
                );
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz', arguments: deck);
              },
              child: const Text('Go'),
            ),
          ],
        ),
      ),
    );
  }
}
