import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class QuestionNumberInfo extends StatelessWidget {
  const QuestionNumberInfo({
    Key key,
    @required QuestionController questionController,
  }) : _questionController = questionController, super(key: key);

  final QuestionController _questionController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text.rich(
        TextSpan(
          text: "Question ${_questionController.questionNumber}",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Color(0xFF8B94BC)),
          children: [
            TextSpan(
              text: "/${_questionController.questions.length}",
              style: Theme.of(context).textTheme.headline6.copyWith(color: Color(0xFF8B94BC))
            )
          ]
        )
      ),
    );
  }
}