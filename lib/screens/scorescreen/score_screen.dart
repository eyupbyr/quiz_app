import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';

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
                SizedBox(height: 130,),
                Text(
                  "Score",style: Theme.of(context).textTheme.headline3!.copyWith(color: SecondaryColor),
                ),
                SizedBox(height: 70,),
                Text(
                  "${(_questionController.correctAnswerCount / _questionController.questionCount * 100).toStringAsFixed(2)}%",
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: SecondaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                Text(
                  "You answered ${_questionController.correctAnswerCount} correct from ${_questionController.questionCount} questions.",
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: SecondaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 110,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => {_questionController.resetEverything()},//_questionController.resetEverything(), //change here
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
                      onTap: () => {},
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
              ],
            ),
          )
        ],
      ),
    );
  }
}