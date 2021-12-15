import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class Countdown extends StatelessWidget {
  const Countdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3F4768),
          width: 3
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth - constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                                colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                )
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(30 - controller.animation.value * 30).round()} sec",
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SvgPicture.asset("assets/icons/clock.svg")
                    ],
                  ),
                )
              )
            ],
          );
        },
      ),
    );
  }
}