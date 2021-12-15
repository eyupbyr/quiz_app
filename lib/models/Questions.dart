import 'package:floor/floor.dart';

@entity
class Question {
  @primaryKey
  int? id; 

  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final String answers;

  Question({this.id, required this.category, required this.type, required this.difficulty, required this.question, required this.correctAnswer, required this.answers});

  Question.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        type = json['type'],
        difficulty = json['difficulty'],
        correctAnswer = json['correct_answer'],
        question = json['question'],
        answers = json['incorrect_answers'][0].toString() + "|" + json['incorrect_answers'][1].toString()  + "|" + json['incorrect_answers'][2].toString()  + "|" + json['correct_answer'];
        
}

const List sample_list = [
  {
    "id": 1,
    "category": "General Knowledge",
    "type": 'Multiple Choice',
    "difficulty": 'Medium',
    "question": 'A memory location that holds a single letter or number.',
    "correctAnswer": 'Google',
    "answers": 'Apple,Google,Facebook,Microsoft',
  }
];
