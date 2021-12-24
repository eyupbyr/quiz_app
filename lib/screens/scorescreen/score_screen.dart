import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/answerscreen/answer_screen.dart';

import '../../constants.dart';

class ScoreScreen extends StatelessWidget {
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
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Column(
              children: [
                Spacer(flex: 3,),
                Text(
                  "Score",style: Theme.of(context).textTheme.headline3!.copyWith(color: SecondaryColor),
                ),
                Spacer(flex: 2,),
                Text(
                  "${(_questionController.correctAnswerCount / _questionController.quizQuestions.length * 100).toStringAsFixed(2)}%",
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: SecondaryColor),
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 1,),
                Text(
                  "You answered ${_questionController.correctAnswerCount} correct from ${_questionController.quizQuestions.length} questions.",
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: SecondaryColor),
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    InkWell(
                      onTap: () => {Get.to(() => AnswerScreen())},
                      child: Container(
                        height: 85,
                        width: 135,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Text("Check Your Answers", style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,)
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}