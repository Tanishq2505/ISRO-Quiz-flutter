import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isro_quiz/controllers/question_controller.dart';
import 'package:isro_quiz/widgets/question_body.dart';

import '../constants.dart';

class QuizScreen extends StatelessWidget {
  static const String id = "quiz_screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as QuizArguments;
    final kSubject subject = args.subject;
    QuestionController _controller =
        Get.put(QuestionController(subject, context));
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kQuizBackgroundColors,
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Body(
        subject: subject,
      ),
    );
  }
}

class QuizArguments {
  final kSubject subject;
  QuizArguments({this.subject = kSubject.sub1});
}
