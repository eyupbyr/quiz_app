import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/models/Questions.dart';

import '../mainscreen/components/category.dart';

class MainScreen extends StatelessWidget {

  final QuestionDao questionDao;

  const MainScreen({
    required this.questionDao,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill ,height: double.infinity,
          width: double.infinity),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Text(
                      "QuizApp",
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 80,),
                    Text(
                      "Choose a category!"
                    ),
                    SizedBox(height: 30,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Category(questionDao: questionDao),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Category(questionDao: questionDao),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Category(questionDao: questionDao),
                          ],
                        ),
                      ],
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
