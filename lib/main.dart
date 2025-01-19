import 'package:flutter/material.dart';
import 'package:timeline_project/screens/home.dart';
import 'package:timeline_project/screens/quiz.dart';
import 'package:timeline_project/screens/result.dart';
import 'package:timeline_project/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/quiz': (context) => QuizScreen(),
        '/result': (context) => ResultScreen(score: 0), 
      },
    );
  }
}
