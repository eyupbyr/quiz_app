import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    List<String> answers = question.answers.toString().split("|");
    answers.shuffle();
    
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Color(0xFF101010))
          ),
          SizedBox(height: 10),
          ...List.generate(
            answers.length, 
            (index) => Option(
              index: index,
              text: answers[index],
              press: () => _questionController.checkAnswer(question, answers[index]),
            )
          )
        ]
      ),
    );
  }
}