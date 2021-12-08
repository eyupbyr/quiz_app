import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key key, 
    this.text, 
    this.index,
    this.press 
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
            if(index == questionController.correctAnswerIndex) {
              return GreenColor;
            } 
            else if(index == questionController.selectedAnswerIndex 
                            && questionController.selectedAnswerIndex != questionController.correctAnswerIndex) {
                return RedColor;
            }
          }
          return GrayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == RedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
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
                Text(
                  "${index +1}. $text",
                  style: TextStyle(color: getTheRightColor(), fontSize: 16),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == GrayColor ? Colors.transparent : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor())
                  ),
                  child: getTheRightIcon() == GrayColor ? null : Icon(getTheRightIcon(), size: 16)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}