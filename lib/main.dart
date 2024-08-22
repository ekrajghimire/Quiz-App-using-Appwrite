import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    ));

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Column(
        children: [
          // For Question
          Container(
            height: 100,
            child: Text(
              'Qn.',
              style: const TextStyle(fontSize: 24.0),
            ),
          )
        ],
      ),
    );
  }
}
