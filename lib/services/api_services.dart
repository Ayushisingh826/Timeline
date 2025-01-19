import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:timeline_project/models/question.dart';

Future<List<Question>> fetchQuizData() async {
  final response = await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));

  if (response.statusCode == 200) {
    final List jsonData = json.decode(response.body);
    return jsonData.map((data) => Question.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load quiz data');
  }
}
