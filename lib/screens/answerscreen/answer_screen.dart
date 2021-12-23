import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/settings_controller.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';
import 'package:quiz_app/screens/quizscreen/quiz_screen.dart';

import '../../constants.dart';
import 'components/answer_info.dart';

class AnswerScreen extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill ,height: double.infinity,
          width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Score ${(_questionController.correctAnswerCount / _questionController.questionCount * 100).toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: SecondaryColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Answers",
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: SecondaryColor, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Divider(thickness: 2.5,),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _questionController.quizQuestions.length,
                    itemBuilder: (context, index) {
                      return AnswerInfo(
                        questionNumber: index + 1,
                        questionText: _questionController.quizQuestions[index].question,
                        givenAnswer: _questionController.givenAnswers[index],
                        correctAnswer: _questionController.quizQuestions[index].correctAnswer,
                      );
                    },
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () => {_questionController.resetEverything()},
                    child: Container(
                      height: 85,
                      width: 135,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Text("Homepage", style: TextStyle(fontSize: 20,))
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}