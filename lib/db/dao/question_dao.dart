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

  @Query('SELECT * FROM Question WHERE category = :category AND difficulty = :difficulty' + 
  ' ORDER BY RANDOM() LIMIT :numberOfQuestions')
  Stream<List<Question>> selectQuizQuestions(String category, String difficulty, int numberOfQuestions);

  @insert
  Future<void> insertQuestion(Question question);

  @insert
  Future<void> insertAllQuestion(List<Question> question);

  @Query('DELETE FROM Question')
  Future<Question?> deleteAllQuestion();
}