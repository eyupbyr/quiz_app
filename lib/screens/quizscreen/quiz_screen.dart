import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quizscreen/components/question_card.dart';
import 'components/countdown.dart';
import 'components/question_number_info.dart';

class QuizScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Countdown(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: QuestionNumberInfo(questionController: _questionController),
                ),
                Divider(thickness: 1.5, indent: 25, endIndent: 25),
                SizedBox(height: 30),
                Flexible(
                  fit: FlexFit.loose,
                  child: PageView.builder(
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateQuestionNumber,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index]),
                  ),
                ),
                SizedBox(height: 40)
              ]
            )
          )
        ]
      ),
    );
  }
}
