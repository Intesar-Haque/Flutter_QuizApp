import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app_frontend/models/multiple_choice_quiz.dart';
import 'package:quiz_app_frontend/screens/score_screen.dart';
import 'package:quiz_app_frontend/services/quiz_service.dart';

class MultipleChoiceQuizController extends GetxController with SingleGetTickerProviderMixin {

  late int _length;
  int get length => _length;

  late AnimationController _animationController;

  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;

  PageController get pageController => _pageController;

  List<MultipleChoiceQuiz> _questions = [];

  List<MultipleChoiceQuiz> get questions => _questions;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(
        duration: const Duration(seconds: 20), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswerAndGetNextQuestion(MultipleChoiceQuiz question, bool isCorrect) {
    _isAnswered = true;
    isCorrect? _numOfCorrectAns++ : null;
    _animationController.stop();
    update();
    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value < _length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      _questionNumber.value = 0;
      _isAnswered = false;
      Get.to(() => ScoreScreen());
      // Get.to(const ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void setLength(int length){
    _length = length;
  }
}
