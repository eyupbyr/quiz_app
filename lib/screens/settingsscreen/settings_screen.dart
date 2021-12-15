import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/settings_controller.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';
import 'package:quiz_app/screens/quizscreen/quiz_screen.dart';

import '../../constants.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //QuestionController _questionController = Get.put(QuestionController());
    //SettingsController _settingsController = Get.put(SettingsController());
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (settingsController) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill ,height: double.infinity,
              width: double.infinity),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),
                    Text(
                      "Quiz Settings",
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: 2,),
                    SizedBox(height: 60),
                    Row(
                      children: [
                        Text(
                          "Difficulty : ",
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                        ), 
                        DropdownButton<String>(
                          onChanged: (newValue) {
                            settingsController.setSelectedDifficulty(newValue!);
                            settingsController.update();
                          },
                          value: settingsController.difficulty,
                          icon: const Icon(Icons.arrow_downward),
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),                           
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          items: <String>['Easy', 'Medium', 'Hard']
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text(
                          "Countdown : ",
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                        DropdownButton<String>(
                          onChanged: (newValue) {
                            settingsController.setSelectedCountdown(newValue!);
                            settingsController.update();
                          },
                          value: settingsController.countdown,
                          icon: const Icon(Icons.arrow_downward),
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),                           
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          items: <String>['15', '30', '45','60']
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text(
                          "Number of Questions : ",
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                        DropdownButton<String>(
                          onChanged: (newValue) {
                            settingsController.setSelectedNumberOfQuestions(newValue!);
                            settingsController.update();
                          },
                          value: settingsController.numberOfQuestions,
                          icon: const Icon(Icons.arrow_downward),
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),                           
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          items: <String>['10', '15', '20']
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Center(
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(500))
                        ),
                        child: ElevatedButton(onPressed: () => {}, child: Text("Play"),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}