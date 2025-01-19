import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    String resultMessage;
    if (score >= 8) {
      resultMessage = 'Excellent!';
    } else if (score >= 5) {
      resultMessage = 'Good Job!';
    } else {
      resultMessage = 'Try Again!';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score/10',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            Text(
              resultMessage,
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home'); 
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
