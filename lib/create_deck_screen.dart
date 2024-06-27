import 'package:flash_cards_app/main.dart';
import 'package:flutter/material.dart';

class CreateDeckScreen extends StatefulWidget {
  const CreateDeckScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateDeckScreenState createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  final TextEditingController _deckNameController = TextEditingController();
  final List<Map<String, String>> _questions = [];
  int _currentQuestionIndex = 0;

  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  late Map<String, dynamic>? _deck;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _deck = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (_deck != null) {
      _deckNameController.text = _deck!['name'];
      _questions.addAll(_deck!['flashcards']);
    } else {
      _questions.add({'question': '', 'answer': ''});
    }
    _loadCurrentQuestion();
  }

  void _loadCurrentQuestion() {
    if (_currentQuestionIndex < _questions.length) {
      _questionController.text = _questions[_currentQuestionIndex]['question']!;
      _answerController.text = _questions[_currentQuestionIndex]['answer']!;
    }
  }

  void _saveCurrentQuestion() {
    if (_currentQuestionIndex < _questions.length) {
      _questions[_currentQuestionIndex]['question'] = _questionController.text;
      _questions[_currentQuestionIndex]['answer'] = _answerController.text;
    }
  }

  void _done() {
    _saveCurrentQuestion();
    if (_deck != null) {
      _deck!['flashcards'] = List<Map<String, String>>.from(_questions);
    } else {
      decks.add({
        'name': _deckNameController.text,
        'flashcards': List<Map<String, String>>.from(_questions)
      });
    }
    Navigator.pushNamed(context, '/decks');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => true, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new deck'),
          automaticallyImplyLeading: true, 
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _deckNameController,
                decoration: const InputDecoration(labelText: 'Deck name'),
              ),
              TextField(
                controller: _questionController,
                decoration: const InputDecoration(labelText: 'Question'),
                onChanged: (value) {
                  _questions[_currentQuestionIndex]['question'] = value;
                },
              ),
              TextField(
                controller: _answerController,
                decoration: const InputDecoration(labelText: 'Answer'),
                onChanged: (value) {
                  _questions[_currentQuestionIndex]['answer'] = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_currentQuestionIndex > 0) {
                          _saveCurrentQuestion();
                          _currentQuestionIndex--;
                          _loadCurrentQuestion();
                        }
                      });
                    },
                    child: const Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _saveCurrentQuestion();
                        if (_currentQuestionIndex == _questions.length - 1) {
                          _questions.add({'question': '', 'answer': ''});
                        }
                        _currentQuestionIndex++;
                        _loadCurrentQuestion();
                      });
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _done,
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
