import 'package:floor/floor.dart';
import 'package:quiz_app/models/Questions.dart';

@dao
abstract class QuestionDao {
  @Query('SELECT * FROM Question')
  Future<List<Question>> findAllQuestions();

  @Query('SELECT * FROM Question')
  Stream<List<Question>> findAllQuestionsAsStream();

  @Query('SELECT * FROM Question WHERE id = :id')
  Stream<Question?> findQuestionById(int id);

  @insert
  Future<void> insertQuestion(Question question);

  @Query('DELETE FROM Question')
  Future<Question?> deleteAllQuestion();
}