import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/settings_controller.dart';
import 'package:quiz_app/db/dao/question_dao.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';
import 'package:quiz_app/screens/scorescreen/score_screen.dart';

class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late String _correctAnswer;
  String get correctAnswer => this._correctAnswer;

  late String _selectedAnswer;
  String get selectedAnswer => this._selectedAnswer;

  //for score screen
  int _correctAnswerCount = 0;
  int get correctAnswerCount => this._correctAnswerCount;

  //for answers screen
  late List<Question> _quizQuestions;
  List<Question> get quizQuestions => this._quizQuestions;
  void set quizQuestions(List<Question> value) => this._quizQuestions = value;

  late List<String> _givenAnswers;
  List<String> get givenAnswers => this._givenAnswers;
  void set givenAnswers(List<String> value) => this._givenAnswers = value;
  

  late QuestionDao _questionDao;
  QuestionDao get questionDao => this._questionDao;
  void set questionDao(QuestionDao value) => this._questionDao = value; 

  @override
  void onInit() {
    _animationController = 
      AnimationController(
        duration: Duration(seconds: int.parse(Get.find<SettingsController>().countdown)), 
        vsync: this
      );
    _animation = Tween<double>(begin: 0,end: 1).animate(_animationController)
    ..addListener(() {
      update();
    });

    //start the countdown animation  
    _animationController.forward().whenComplete(()
    {
      _selectedAnswer = "-";
      givenAnswers.add(_selectedAnswer); // add empty answer to the list because question is not answered
      nextQuestion(); //if the counter is completed before answering the question go to the next question
    });

    _pageController = PageController();
    _givenAnswers = [];

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, String selectedAnswer) {
      _isAnswered = true;
      _correctAnswer = question.correctAnswer;
      _selectedAnswer = selectedAnswer;
      givenAnswers.add(selectedAnswer);

      if(_correctAnswer == _selectedAnswer) 
        _correctAnswerCount++;

      _animationController.stop();
      update();

      //after 1 second go to the next question
      Future.delayed(Duration(seconds: 1), nextQuestion);
  }

  void nextQuestion() {
    //if the question is not the last question
    if (_questionNumber.value != _quizQuestions.length) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);

      _isAnswered = false;

      // reset the countdown counter and start again
      _animationController.reset();
      _animationController.forward().whenComplete(()
      {
        _selectedAnswer = "-";
        givenAnswers.add(selectedAnswer); // add empty answer to the list because question is not answered
        nextQuestion();
      }); //if the counter completed before answering the question
                                                                 //go to next question
    }
    else {
      Get.to(() => ScoreScreen());
    } 
  }

  void updateQuestionNumber(int index){
    _questionNumber.value = index + 1;
    if(_selectedAnswer == "");
      
  }

  void resetEverything()
  {
    Get.deleteAll();
    Get.to(MainScreen(questionDao: questionDao));
  }
}