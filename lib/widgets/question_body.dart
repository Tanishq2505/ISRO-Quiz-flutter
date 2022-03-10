import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/controllers/question_controller.dart';
import 'package:isro_quiz/widgets/progress_bar.dart';

import '../models/question.dart';

class Body extends StatelessWidget {
  final kSubject subject;
  const Body({Key? key, required this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController =
        Get.put(QuestionController(subject, context));
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProgressBar(),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                  ),
                  text: "Question ${_questionController.questionNumber.value}",
                  children: [
                    TextSpan(
                      text: "/${_questionController.questions.length}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 1.5,
            color: Colors.grey.shade800,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: _questionController.updateTheQnNum,
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) =>
                  QuestionCard(_questionController.questions[index], subject),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final kSubject subject;
  QuestionCard(@required this.question, this.subject);
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller =
        Get.put(QuestionController(subject, context));
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.questionText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            "Difficulty: ${question.category.name}",
            style: TextStyle(
              color: Colors.red.shade900,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              text: question.options[index],
              index: index,
              press: () => _controller.checkAns(question, index),
              subject: subject,
            ),
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;
  final kSubject subject;
  Option(
      {required this.text,
      required this.index,
      required this.press,
      required this.subject});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(subject, context),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return Colors.green;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return Colors.red;
            }
          }
          return Colors.grey;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: getTheRightColor() == Colors.grey
                    ? Colors.transparent
                    : getTheRightColor().withOpacity(0.05),
                border: Border.all(
                  color: getTheRightColor(),
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "${index + 1}. $text",
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: getTheRightColor(),
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      color: getTheRightColor() == Colors.grey
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor())),
                  child: getTheRightColor() == Colors.grey
                      ? null
                      : Icon(
                          getTheRightIcon(),
                          size: 16,
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
