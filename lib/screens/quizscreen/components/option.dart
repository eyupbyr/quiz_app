import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key, 
    required this.text, 
    required this.index,
    required this.press 
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (questionController) {

        Color getTheRightColor() {
          if(questionController.isAnswered) {
            if(text == questionController.correctAnswer) {
              return GreenColor;
            } 
            else if(text == questionController.selectedAnswer 
                            && questionController.selectedAnswer != questionController.correctAnswer) {
                return RedColor;
            }
          }
          return Colors.grey;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == RedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: questionController.isAnswered ? null : press,
          child: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                          border: Border.all(color: getTheRightColor()),
                          borderRadius: BorderRadius.circular(15),
                        ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "${index +1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == Colors.grey ? Colors.transparent : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor())
                  ),
                  child: getTheRightIcon() == Colors.grey ? null : Icon(getTheRightIcon(), size: 16)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}