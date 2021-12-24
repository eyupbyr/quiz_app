import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/db/database.dart';
import 'package:quiz_app/screens/mainscreen/main_screen.dart';

import 'db/dao/question_dao.dart';
import 'models/Questions.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase
      .databaseBuilder('question.db')
      .build();
  final questionDao = database.questionDao;

  List data;
  var jsonText = await rootBundle.loadString('assets/data/questions.json');
  data = json.decode(jsonText);

  List<Question> questions = [];
  questionDao.deleteAllQuestion();
  data.forEach((element) => questions.add(Question.fromJson(element)));

  questionDao.insertAllQuestion(questions);
  questions.clear();
  
  runApp(MyApp(questionDao));
}

class MyApp extends StatelessWidget {
  final QuestionDao questionDao;
  const MyApp(this.questionDao);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainScreen(
        questionDao: questionDao
      ),
    );
  }
}