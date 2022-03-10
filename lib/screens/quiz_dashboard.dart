import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/questions_screen.dart';

class QuizDashboard extends StatefulWidget {
  static const String id = "quiz_dashboard";
  const QuizDashboard({Key? key}) : super(key: key);

  @override
  _QuizDashboardState createState() => _QuizDashboardState();
}

class _QuizDashboardState extends State<QuizDashboard> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as QuizArguments;
    return Scaffold(
      backgroundColor: kQuizBackgroundColors,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Let's Play Quiz,",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Select Your Subject -",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kColorPrimary),
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                QuizScreen.id,
                arguments: QuizArguments(subject: kSubject.sub1),
              ),
              child: Text("Subject 1"),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(kColorSecondary.withBlue(255)),
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                QuizScreen.id,
                arguments: QuizArguments(subject: kSubject.sub2),
              ),
              child: Text("Subject 2"),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kColorPrimary),
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                QuizScreen.id,
                arguments: QuizArguments(subject: kSubject.sub3),
              ),
              child: Text("Subject 3"),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "All The Best! 👍",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
