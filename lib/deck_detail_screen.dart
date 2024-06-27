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
          title: Text(
            deck['name'],
            style: const TextStyle(
              color: Color.fromARGB(255, 18, 7, 39), // Crna boja za naslov
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Poravnanje na levo
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0), // Odmak od levog kraja
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(IconData(0xe21a,
                        fontFamily: 'MaterialIcons')), // Ikonica za edit
                    label: const Text('Add more'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/createDeck',
                          arguments: deck);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20), // Razmak između dugmadi
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0), // Odmak od levog kraja
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(IconData(0xe1b9,
                        fontFamily: 'MaterialIcons')), // Ikonica za delete
                    label: const Text('Delete'),
                    onPressed: () {
                      decks.remove(deck);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Deck deleted successfully')),
                      );
                      Navigator.pop(context,
                          true); // Vraća true da označi uspešno brisanje
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20), // Razmak između dugmadi
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0), // Odmak od levog kraja
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(IconData(0xf0573,
                        fontFamily: 'MaterialIcons')), // Ikonica za go
                    label: const Text('Go'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz', arguments: deck);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
