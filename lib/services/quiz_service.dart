import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app_frontend/models/multiple_choice_quiz.dart';

class QuizService {
  getQuiz() async {
    var response = await http.post(Uri.parse('http://10.0.2.2:8080/get-quiz'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<MultipleChoiceQuiz> quizList = [];
      for (var element in jsonList) {
        print(element);
        quizList.add(MultipleChoiceQuiz.fromJson(element));
      }
      return quizList;
    } else {
      throw Exception('Failed to Get Quiz');
    }
  }
}
