import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/dashboard_screen.dart';
import 'package:isro_quiz/screens/registration_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../widgets/rounded_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_Screen";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  bool _showSpinner = true;
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    initializeFirebase();
    controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
      upperBound: 1,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  void initializeFirebase() async {
    await Firebase.initializeApp();
    final _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      final _firestore = FirebaseFirestore.instance;
      final data = await _firestore.collection("users").doc(_user.uid).get();

      controller.dispose();
      setState(() {
        _showSpinner = false;
      });
      Navigator.pushReplacementNamed(context, DashboardScreen.id,
          arguments: NameArgument(data.data()!["name"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: kLogoTag,
                child: Container(
                  child: Image.asset('assets/logo.png'),
                  height: 60,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                colour: kColorPrimary,
                text: "Log In",
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                colour: kColorSecondary,
                onPress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                text: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
