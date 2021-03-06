import 'package:get/get.dart';


class SettingsController extends GetxController {

  String _difficulty = 'Easy';
  String get difficulty => this._difficulty;

  String _countdown = '30';
  String get countdown => this._countdown;

  String _numberOfQuestions = '20';
  String get numberOfQuestions => this._numberOfQuestions;

  late String _category;
  String get category => this._category;

  void setSelectedDifficulty(String value){
     _difficulty = value;
   }

   void setSelectedCountdown(String value){
     _countdown = value;
   }

   void setSelectedNumberOfQuestions(String value){
     _numberOfQuestions = value;
   }

   void setSelectedCategory(String value){
     _category = value;
   }

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}