import 'package:flutter/material.dart';
import 'package:isro_quiz/screens/dashboard_screen.dart';
import 'package:isro_quiz/screens/login_screen.dart';
import 'package:isro_quiz/screens/registration_screen.dart';
import 'package:isro_quiz/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISRO Quiz',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
      },
    );
  }
}
