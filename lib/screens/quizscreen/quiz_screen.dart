import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/settings_controller.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/screens/quizscreen/components/question_card.dart';
import 'components/countdown.dart';
import 'components/question_number_info.dart';

class QuizScreen extends StatefulWidget {
  final QuestionDao questionDao;
  QuizScreen(this.questionDao, {QuestionDao? dao});

  @override
  _QuizScreenState createState() => _QuizScreenState(questionDao);
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionDao questionDao;
  _QuizScreenState(this.questionDao);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    SettingsController _settingsController = Get.put(SettingsController());
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill ,height: double.infinity,
          width: double.infinity),
          SafeArea(
            child: StreamBuilder<Object>(
              stream: questionDao.selectQuizQuestions(_settingsController.category, _settingsController.difficulty.toLowerCase(), int.parse(_settingsController.numberOfQuestions)),
              builder: (context, AsyncSnapshot  snapshot) {
                if (!snapshot.hasData) return Container();

                final questions = snapshot.data;
                _questionController.questionCount = questions.length;

                print(questions);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Countdown(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: QuestionNumberInfo(questionController: _questionController),
                    ),
                    Divider(thickness: 1.5, indent: 25, endIndent: 25),
                    SizedBox(height: 30),
                    Flexible(
                        fit: FlexFit.loose,
                        child: PageView.builder(
                          controller: _questionController.pageController,
                          onPageChanged: _questionController.updateQuestionNumber,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _questionController.questionCount,
                          itemBuilder: (context, index) => QuestionCard(question: questions[index]),
                        ),
                      ),
                    SizedBox(height: 40)
                  ]
                );
              }
            )
          )
        ]
      ),
    );
  }
}
