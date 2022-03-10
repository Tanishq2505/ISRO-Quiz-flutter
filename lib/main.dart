import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/centres_dashboard.dart';
import 'package:isro_quiz/screens/dashboard_screen.dart';
import 'package:isro_quiz/screens/launchers_dashboard.dart';
import 'package:isro_quiz/screens/login_screen.dart';
import 'package:isro_quiz/screens/questions_screen.dart';
import 'package:isro_quiz/screens/quiz_dashboard.dart';
import 'package:isro_quiz/screens/registration_screen.dart';
import 'package:isro_quiz/screens/satellite_dashboard.dart';
import 'package:isro_quiz/screens/score_screen.dart';
import 'package:isro_quiz/screens/spacecrafts_dashboard.dart';
import 'package:isro_quiz/screens/study_dashboard.dart';
import 'package:isro_quiz/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ISRO Quiz',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        StudyDashboard.id: (context) => StudyDashboard(),
        SpacecraftDashboard.id: (context) => SpacecraftDashboard(),
        LaunchersDashboard.id: (context) => LaunchersDashboard(),
        SatelliteDashboard.id: (context) => SatelliteDashboard(),
        CentresDashboard.id: (context) => CentresDashboard(),
        QuizDashboard.id: (context) => QuizDashboard(),
        QuizScreen.id: (context) => QuizScreen(),
        ScoreScreen.id: (context) => ScoreScreen(
              subject: kSubject.sub1,
            ),
      },
    );
  }
}
