import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app_frontend/commons/constraints.dart';
import 'package:quiz_app_frontend/screens/multiple_choice_quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/background.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    "Quiz App",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 2),
                  InkWell(
                    onTap: () => Get.to(const MultipleChoiceQuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Multiple Choice Quiz",
                        style: Theme.of(context).textTheme.button?.copyWith(color: kWhiteColor),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // InkWell(
                  //   onTap: () => Get.to(const MultipleChoiceQuizScreen()),
                  //   child: Container(
                  //     width: double.infinity,
                  //     alignment: Alignment.center,
                  //     padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                  //     // 15
                  //     decoration: const BoxDecoration(
                  //       gradient: kPrimaryGradient,
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //     child: Text(
                  //       "Other Quiz",
                  //       style: Theme.of(context).textTheme.button?.copyWith(color: kWhiteColor),
                  //     ),
                  //   ),
                  // ),
                  // const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
