import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class AnswerInfo extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final String givenAnswer;
  final String correctAnswer;

  const AnswerInfo({
    Key? key, 
    required this.questionNumber, 
    required this.questionText, 
    required this.givenAnswer, 
    required this.correctAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: givenAnswer == "-" ? GrayColor : givenAnswer == correctAnswer ? GreenColor : RedColor
                  ),
                  child: Text(
                    questionNumber.toString(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                  )
                )
              ],
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                children: [
                  Text(
                    questionText,
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: GrayColor, fontWeight: FontWeight.bold)
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Given Answer: " + givenAnswer,
                style: Theme.of(context).textTheme.headline6!.copyWith(color: GrayColor, fontWeight: FontWeight.bold)
              ),
            ),
            Icon(
              givenAnswer == correctAnswer ? Icons.done : Icons.close, 
              color: givenAnswer == "-" ? GrayColor : givenAnswer == correctAnswer ? GreenColor : RedColor,
            )
          ],
        ),
        SizedBox(height: 10,),
        if(givenAnswer != correctAnswer)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Correct Answer: " + correctAnswer,
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: GrayColor, fontWeight: FontWeight.bold)
                ),
              ),
              Icon(Icons.done, color: GreenColor,)
            ],
          ),
        Divider(thickness: 1.5,),
        SizedBox(height: 10,),
      ],
    );
  }
}