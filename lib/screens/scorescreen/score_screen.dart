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
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: SecondaryColor),
              ),
              Spacer(),
              Text(
                "${_questionController.correctAnswerCount * 10}/${_questionController.questionCount * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: SecondaryColor),
              ),
              Spacer(flex: 2),
              InkWell(
                onTap: () => {},//_questionController.resetEverything(), //change here
                child: Container(
                  height: 85,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: Text("Homepage", style: TextStyle(fontSize: 20,))
                ),
              ),
              Spacer(flex: 2)
            ],
          )
        ],
      ),
    );
  }
}