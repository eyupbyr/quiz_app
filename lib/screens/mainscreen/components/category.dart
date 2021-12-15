import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/screens/quizscreen/quiz_screen.dart';

class Category extends StatelessWidget {

  final QuestionDao questionDao;

  const Category({
    required this.questionDao,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => QuizScreen(questionDao)),
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
                        'General Knowledge',
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
}