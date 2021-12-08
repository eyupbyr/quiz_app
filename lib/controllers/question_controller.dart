import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';
import 'package:quiz_app/screens/scorescreen/score_screen.dart';

class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_list.
      map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index']
        )
      )
  .toList();

  List<Question> get questions => this._questions;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswerIndex;
  int get correctAnswerIndex => this._correctAnswerIndex;

  int _selectedAnswerIndex;
  int get selectedAnswerIndex => this._selectedAnswerIndex;

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

  void checkAnswer(Question question, int selectedIndex) {
      _isAnswered = true;
      _correctAnswerIndex = question.answer;
      _selectedAnswerIndex = selectedIndex;

      if(_correctAnswerIndex == _selectedAnswerIndex) 
        _correctAnswerCount++;

      _animationController.stop();
      update();

      //after 1 second go to the next question
      Future.delayed(Duration(seconds: 1), nextQuestion);
  }

  void nextQuestion() {
    //if the question is not the last question
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);

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

  //!!! MOVE THIS TO ANOTHER CONTROLLER
  void resetEverything() {
    Get.to(() => MainScreen());
    Get.deleteAll();
  }


}