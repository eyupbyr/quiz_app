// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/question_dao.dart';
import 'package:quiz_app/models/Questions.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Question])
abstract class AppDatabase extends FloorDatabase {
  QuestionDao get questionDao;
}