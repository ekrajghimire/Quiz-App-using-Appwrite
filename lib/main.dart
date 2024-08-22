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

  // Get Data from API()
  Future getData() async {
    String url =
        'https://cloud.appwrite.io/v1/databases/66c2e402003d6341b865/collections/66c2e41200346c92a802/documents';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
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
        onPressed: () {},
        backgroundColor: Colors.blueAccent.shade400,
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // For Question
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(5)),
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Qn.',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),

            //opt1
            MaterialButton(
              color: Colors.blue,
              minWidth: double.infinity,
              height: 50,
              onPressed: () {},
              child: const Text(
                'Opt 1',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),

            //opt2
            MaterialButton(
              color: Colors.blue,
              minWidth: double.infinity,
              height: 50,
              onPressed: () {},
              child: const Text(
                'Opt 2',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),

            //opt3
            MaterialButton(
              color: Colors.blue,
              minWidth: double.infinity,
              height: 50,
              onPressed: () {},
              child: const Text(
                'Opt 3',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),

            //opt4
            MaterialButton(
              color: Colors.blue,
              minWidth: double.infinity,
              height: 50,
              onPressed: () {},
              child: const Text(
                'Opt 4',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
