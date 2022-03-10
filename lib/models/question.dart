import 'package:isro_quiz/constants.dart';

class Question {
  String questionText = "";
  String questionAnswer = '';
  List<String> options = [];
  kQuestionLevel category = kQuestionLevel.Easy;
  int marks;
  Question(this.questionText, this.questionAnswer, this.options, this.category,
      this.marks);
}
