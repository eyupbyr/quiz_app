import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/settings_controller.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/screens/quizscreen/quiz_screen.dart';
import 'package:quiz_app/screens/settingsscreen/settings_screen.dart';

class Category extends StatelessWidget {

  final QuestionDao questionDao;
  final String categoryName;

  const Category({
    required this.questionDao, required this.categoryName,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (settingsController) {
        return InkWell(
          onTap: () { 
            settingsController.setSelectedCategory(categoryName);
            settingsController.update();
            Get.to(() => SettingsScreen(questionDao));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                    children: [
                      Icon(Icons.account_circle, size: 40),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            categoryName,
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    ],
                  ),
            ),
          ),
        );
      }
    );
  }
}