import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app_frontend/commons/constraints.dart';
import 'package:quiz_app_frontend/controllers/multiple_choice_quiz_controller.dart';
import 'package:quiz_app_frontend/models/multiple_choice_quiz.dart';
import 'package:quiz_app_frontend/services/quiz_service.dart';
import '../count_down_progress_bar.dart';
import 'multiple_choice_quiz_card.dart';

class MultipleChoiceQuizBody extends StatefulWidget {

  const MultipleChoiceQuizBody({Key? key}) : super(key: key);

  @override
  State<MultipleChoiceQuizBody> createState() => _MultipleChoiceQuizBodyState();
}

class _MultipleChoiceQuizBodyState extends State<MultipleChoiceQuizBody> {
  MultipleChoiceQuizController _questionController = Get.put(MultipleChoiceQuizController());
  List<MultipleChoiceQuiz> questions = [];

  @override
  void initState() {
    QuizService quizService = QuizService();
    quizService.getQuiz().then((data) {
      setState(() {
        questions = data;
        _questionController.setLength(questions.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              SvgPicture.asset("assets/icons/background.svg", fit: BoxFit.fill),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: CountDownProgressBar(),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Obx(
                        () => Text.rich(
                          TextSpan(
                            text:
                                "Question ${_questionController.questionNumber.value}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: kSecondaryColor),
                            children: [
                              TextSpan(
                                text:
                                    "/${questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(thickness: 1.5),
                    const SizedBox(height: kDefaultPadding),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        onPageChanged: _questionController.updateTheQnNum,
                        itemCount: questions.length,
                        itemBuilder: (context, index) => MultipleChoiceQuizCard(
                            question: questions[index]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
