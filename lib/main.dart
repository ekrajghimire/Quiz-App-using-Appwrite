import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizapp/model.dart';
import 'package:http/http.dart' as http;

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
  // For Quiz List
  List<Quiz> quizes = [];
  int score = 0;
  int currentQuestion = 0;

  // reset
  void reset() {
    setState(() {
      score = 0;
      currentQuestion = 0;
    });
  }

  // check answer
  void checkAnswer(int userChoice) {
    setState(() {
      if (quizes[currentQuestion].correctoption == userChoice) {
        score++;
      }
      if (currentQuestion == quizes.length - 1) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Result'),
                  content: Text('Your score is $score out of ${quizes.length}'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          reset();
                        },
                        child: const Text('Play Again'))
                  ],
                ));
        return;
      }
      currentQuestion++;
    });
  }

  // Get Data from API()
  Future getData() async {
    String url =
        'https://cloud.appwrite.io/v1/databases/66c2e402003d6341b865/collections/66c2e41200346c92a802/documents';
    var response = await http.get(Uri.parse(url), headers: {
      'X-Appwrite-Project': '66c2e3d6000d2068f7d0',
      'X-Appwrite-Key':
          '858534f96891d94826e35af93f14b94288a9945113e8f17de87bd0b8120412b902bd6347d0517669d691ff65f385ad8b0d6f7d9474a277d7da4e2fd237f00093c6ad2bce4cf1d0fc1f42d86d2b46fdf0f929c95e87d5b3edf6583e3816570eb40b866e3e3c92429700d979d10d13e0423b219213d60e4cf4873b7ce8b2181ff3',
    });

    if (response.statusCode == 200) {
      setState(() {
        for (var item in jsonDecode(response.body)['documents']) {
          quizes.add(Quiz(item['title'], item['option1'], item['option2'],
              item['option3'], item['option4'], item['correctoption']));
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.blueAccent.shade400,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          reset();
        },
        backgroundColor: Colors.blueAccent.shade400,
        child: const Icon(Icons.refresh),
      ),
      body: quizes.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('${currentQuestion + 1} out of ${quizes.length}'),
                  const SizedBox(height: 10),

                  // For Question
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(5)),
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Qn. ${quizes[currentQuestion].title}',
                        style: const TextStyle(
                            fontSize: 24.0, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //opt1
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      checkAnswer(1);
                    },
                    child: Text(
                      'A. ${quizes[currentQuestion].option1}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //opt2
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      checkAnswer(2);
                    },
                    child: Text(
                      'B. ${quizes[currentQuestion].option2}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //opt3
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      checkAnswer(3);
                    },
                    child: Text(
                      'C. ${quizes[currentQuestion].option3}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //opt4
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      checkAnswer(4);
                    },
                    child: Text(
                      'D. ${quizes[currentQuestion].option4}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
