import 'package:flutter/material.dart';
import 'dart:async';
import 'result.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int totalQuestions = 10; // Set your total number of questions.
  late Timer timer;
  int timeRemaining = 30; // 30 seconds per question

  // Sample questions
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'answer': '4',
    },
    {
      'question': 'What is the color of the sky?',
      'options': ['Blue', 'Green', 'Red', 'Yellow'],
      'answer': 'Blue',
    },
    // Add more questions here...
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeRemaining == 0) {
        nextQuestion();
      } else {
        setState(() {
          timeRemaining--;
        });
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        timeRemaining = 30; // Reset timer for the next question
      });
    } else {
      // End of quiz, navigate to result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: score)),
      );
    }
  }

  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex]['answer']) {
      setState(() {
        score++;
      });
    }
    nextQuestion();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      // Handle the case where no questions are available.
      return Scaffold(
        body: Center(child: Text("No questions available")),
      );
    }

    var question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              question['question'],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Options
            ...List.generate(question['options'].length, (index) {
              return ElevatedButton(
                onPressed: () {
                  answerQuestion(question['options'][index]);
                },
                child: Text(question['options'][index]),
              );
            }),
            SizedBox(height: 20),
            // Timer Display
            Text(
              'Time Remaining: $timeRemaining seconds',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
