import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  const QuestionAnswerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  int currentIndex = 0;
  bool showAnswer = false;

  late List<Map<String, String>> flashcards;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> deck =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    flashcards = List<Map<String, String>>.from(deck['flashcards']);
  }

  void _showNextCard() {
    setState(() {
      if (currentIndex < flashcards.length - 1) {
        currentIndex++;
        showAnswer = false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have finished the whole deck')),
        );
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          automaticallyImplyLeading: false, 
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    flashcards[currentIndex]['question']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28, 
                      color: Color.fromARGB(255, 18, 7, 39), 
                    ),
                  ),
                ),
              ),
            ),
            if (showAnswer)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  flashcards[currentIndex]['answer']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (showAnswer) {
                    _showNextCard();
                  } else {
                    setState(() {
                      showAnswer = true;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16, 
                    horizontal: 32, 
                  ),
                ),
                child: Text(
                  showAnswer ? 'Next' : 'Show answer',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
