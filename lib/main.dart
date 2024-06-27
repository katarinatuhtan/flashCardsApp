import 'package:flash_cards_app/create_deck_screen.dart';
import 'package:flash_cards_app/deck_detail_screen.dart';
import 'package:flash_cards_app/decks_screen.dart';
import 'package:flash_cards_app/question_answer_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Map<String, dynamic>> decks = [
  {
    'name': 'Flutter',
    'flashcards': [
      {
        'question': 'What is Flutter?',
        'answer':
            'A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.'
      },
      {'question': 'What language does Flutter use?', 'answer': 'Dart.'},
      {'question': 'What is a Widget in Flutter?', 'answer': 'A Widget is a basic building block of a Flutter app\'s user interface, representing a part of the UI that can be drawn on the screen.'},
      {'question': 'What is the difference between StatefulWidget and StatelessWidget in Flutter?', 'answer': 'A StatelessWidget is immutable and cannot change its state once it is built, while a StatefulWidget can change its state over time.'},
      {'question': 'How do you perform asynchronous operations in Flutter?', 'answer': 'Asynchronous operations in Flutter are performed using async and await keywords, along with the Future class.'},
      {'question': 'What is a Navigator in Flutter?', 'answer': 'The Navigator is a widget that manages a stack of route objects and allows for navigation between different screens or pages in a Flutter app.'},
      {'question': 'What is the purpose of the pubspec.yaml file in a Flutter project?', 'answer': 'The pubspec.yaml file is used to manage the project\'s dependencies, assets, and other metadata such as the app\'s name, version, and author details.'},
    ],
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Cards App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/decks': (context) => const DecksScreen(),
        '/deckDetail': (context) => const DeckDetailScreen(),
        '/quiz': (context) => const QuestionAnswerScreen(),
        '/createDeck': (context) => const CreateDeckScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false, // Sprečava vraćanje unazad
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flashcards app',
            style: TextStyle(
              color: Colors.black, // Crna boja za naslov
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false, // Uklanja back dugme
          centerTitle: true, // Centrirani naslov
          elevation: 0, // Uklanjanje senke ispod AppBar-a
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200, // Širina dugmadi
                height: 50, // Visina dugmadi
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/decks');
                  },
                  child: const Text(
                    'Your decks',
                    style:
                        TextStyle(fontSize: 18), // Veći font za tekst dugmeta
                  ),
                ),
              ),
              const SizedBox(height: 20), // Razmak između dugmadi
              SizedBox(
                width: 200, // Širina dugmadi
                height: 50, // Visina dugmadi
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/createDeck');
                  },
                  child: const Text(
                    'Create a new deck',
                    style:
                        TextStyle(fontSize: 18), // Veći font za tekst dugmeta
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
