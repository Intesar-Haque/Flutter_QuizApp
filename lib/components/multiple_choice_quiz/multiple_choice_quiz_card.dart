import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_frontend/commons/constraints.dart';
import 'package:quiz_app_frontend/controllers/multiple_choice_quiz_controller.dart';
import 'package:quiz_app_frontend/models/multiple_choice_quiz.dart';

import 'multiple_choice_quiz_options.dart';

class MultipleChoiceQuizCard extends StatelessWidget {
  const MultipleChoiceQuizCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final MultipleChoiceQuiz question;

  @override
  Widget build(BuildContext context) {
    MultipleChoiceQuizController _controller = Get.put(MultipleChoiceQuizController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length, (index) => MultipleChoiceQuizOption(
              index: index,
              option: question.options.keys.toList()[index],
              answer: question.options.values.toList()[index],
              press: () => _controller.checkAnswerAndGetNextQuestion(
                  question,
                  question.options.values.toList()[index]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
