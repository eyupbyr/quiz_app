import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';
import 'package:quiz_app/screens/scorescreen/score_screen.dart';

class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  //these will be taken as input
  late int _questionCount;
  int get questionCount => this._questionCount;
  void set questionCount(int value) => this._questionCount = value; 

  late int _countdownSeconds;
  int get countdownSeconds => this._countdownSeconds;

  late String _difficulty;
  String get difficulty => this._difficulty;
  //-----------------------------------------------------

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late String _correctAnswer;
  String get correctAnswer => this._correctAnswer;

  late String _selectedAnswer;
  String get selectedAnswer => this._selectedAnswer;

  int _correctAnswerCount = 0;
  int get correctAnswerCount => this._correctAnswerCount;

  @override
  void onInit() {
    _animationController = 
      AnimationController(
        duration: Duration(seconds: 30), 
        vsync: this
      );
    _animation = Tween<double>(begin: 0,end: 1).animate(_animationController)
    ..addListener(() {
      update();
    });

    //start the countdown animation  
    _animationController.forward().whenComplete(nextQuestion); //if the counter completed before answering the question
                                                                //go to next question

    _pageController = PageController();

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

      if(_correctAnswer == _selectedAnswer) 
        _correctAnswerCount++;

      _animationController.stop();
      update();

      //after 1 second go to the next question
      Future.delayed(Duration(seconds: 1), nextQuestion);
  }

  void nextQuestion() {
    //if the question is not the last question
    if (_questionNumber.value != _questionCount) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);

      _isAnswered = false;

      // reset the countdown counter and start again
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion); //if the counter completed before answering the question
                                                                 //go to next question
    }
    else {
      Get.to(() => ScoreScreen());
    } 
  }

  void updateQuestionNumber(int index){
    _questionNumber.value = index + 1;
  }
}