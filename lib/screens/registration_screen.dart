import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/dashboard_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../widgets/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String name;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;
  final _firestore = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: kLogoTag,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: kRegistrationTextFieldDecoration.copyWith(
                  hintText: "Enter your full name",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kRegistrationTextFieldDecoration.copyWith(
                  hintText: "Enter your email",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kRegistrationTextFieldDecoration.copyWith(
                  hintText: "Enter your"
                      " password",
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                colour: kColorSecondary,
                onPress: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    name = name.trim();
                    if (name != "") {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser.user != null) {
                        final uid = newUser.user!.uid;
                        _firestore.doc(uid).set({
                          "name": name,
                          "uid": uid,
                          "created": Timestamp.now(),
                        });
                        Navigator.pushNamedAndRemoveUntil(
                            context, DashboardScreen.id, (route)=>false,
                            arguments: NameArgument(name));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Enter your name"),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                    print(e);
                  }
                  setState(() {
                    _showSpinner = false;
                  });
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
