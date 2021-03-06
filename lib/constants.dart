import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFFF47216);
const kColorSecondary = Color(0xFF0E88D3);
const kQuizBackgroundColors = Color(0xFF0A0F3B);
const kPrimaryGradient = LinearGradient(
  colors: [kColorSecondary, kColorPrimary],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const kLogoTag = "animatedLogo";

const kLoginTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimary, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimary, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kRegistrationTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorSecondary, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorSecondary, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kAppBarTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 28,
);
const kAppBarIconTheme = IconThemeData(
  color: Colors.black54,
);

enum kQuestionLevel { Easy, Medium, Hard }
enum kSubject { sub1, sub2, sub3 }
