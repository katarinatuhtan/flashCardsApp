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
      {
        'question': 'What is a Widget in Flutter?',
        'answer':
            'A Widget is a basic building block of a Flutter app\'s user interface, representing a part of the UI that can be drawn on the screen.'
      },
      {
        'question':
            'What is the difference between StatefulWidget and StatelessWidget in Flutter?',
        'answer':
            'A StatelessWidget is immutable and cannot change its state once it is built, while a StatefulWidget can change its state over time.'
      },
      {
        'question': 'How do you perform asynchronous operations in Flutter?',
        'answer':
            'Asynchronous operations in Flutter are performed using async and await keywords, along with the Future class.'
      },
      {
        'question': 'What is a Navigator in Flutter?',
        'answer':
            'The Navigator is a widget that manages a stack of route objects and allows for navigation between different screens or pages in a Flutter app.'
      },
      {
        'question':
            'What is the purpose of the pubspec.yaml file in a Flutter project?',
        'answer':
            'The pubspec.yaml file is used to manage the project\'s dependencies, assets, and other metadata such as the app\'s name, version, and author details.'
      },
    ],
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcards App',
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
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'FLASHCARDS APP',
            style: TextStyle(
              color: Color.fromARGB(255, 18, 7, 39),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/logo.png',
                  width: 180,
                  height: 180,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/decks');
                      },
                      child: const Text(
                        'Your decks',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/createDeck');
                      },
                      child: const Text(
                        'Create a new deck',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
