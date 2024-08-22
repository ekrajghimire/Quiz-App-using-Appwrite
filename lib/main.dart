import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const QuizApp(),
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
        backgroundColor: Colors.blueAccent.shade400,
      ),
      body: Column(
        children: [
          // For Question
          Container(
            height: 100,
            child: const Text(
              'Qn.',
              style: TextStyle(fontSize: 24.0),
            ),
          )
        ],
      ),
    );
  }
}
