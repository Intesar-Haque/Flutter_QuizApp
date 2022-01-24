import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app_frontend/components/multiple_choice_quiz/multiple_choice_quiz_body.dart';
import 'package:quiz_app_frontend/controllers/multiple_choice_quiz_controller.dart';

class MultipleChoiceQuizScreen extends StatelessWidget {
  const MultipleChoiceQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MultipleChoiceQuizController _controller =
        Get.put(MultipleChoiceQuizController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
              onPressed: _controller.nextQuestion, child: const Text("Skip")
          ),
        ],
      ),
      body: MultipleChoiceQuizBody(),
    );
  }
}
