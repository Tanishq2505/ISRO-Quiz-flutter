import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/study_dashboard.dart';
import 'package:isro_quiz/screens/welcome_screen.dart';
import 'package:isro_quiz/widgets/rounded_button.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = "dashboard_screen";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NameArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actionsIconTheme: kAppBarIconTheme,
        actions: [
          IconButton(
            onPressed: () async {
              await _firebaseAuth.signOut();
              Navigator.pushReplacementNamed(context, WelcomeScreen.id);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        title: Text(
          "Hi, ${args.name.split(" ")[0]}  👋",
          style: kAppBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset(
              'assets/rocket_lottie.json',
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              text: "Let's Play",
              colour: kColorPrimary,
            ),
            RoundedButton(
              text: "Let's Study",
              onPress: () {
                Navigator.pushNamed(context, StudyDashboard.id);
              },
              colour: kColorSecondary,
            )
          ],
        ),
      ),
    );
  }
}

class NameArgument {
  final String name;
  NameArgument(this.name);
}
