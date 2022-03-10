import 'package:flutter/material.dart';
import 'package:isro_quiz/screens/launchers_dashboard.dart';
import 'package:isro_quiz/screens/satellite_dashboard.dart';
import 'package:isro_quiz/screens/spacecrafts_dashboard.dart';

import '../constants.dart';
import 'centres_dashboard.dart';

class StudyDashboard extends StatelessWidget {
  static const String id = "study_dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: kAppBarIconTheme,
          elevation: 0,
          title: const Text(
            "Recent ISRO Data",
            style: kAppBarTextStyle,
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            GridButton(
              title: "Spacecrafts",
              color: kColorSecondary,
              onPress: () =>
                  Navigator.pushNamed(context, SpacecraftDashboard.id),
            ),
            GridButton(
              title: "Launchers",
              color: kColorPrimary,
              onPress: () =>
                  Navigator.pushNamed(context, LaunchersDashboard.id),
            ),
            GridButton(
              title: "Customer Satellites",
              color: kColorPrimary,
              onPress: () =>
                  Navigator.pushNamed(context, SatelliteDashboard.id),
            ),
            GridButton(
              title: "Centres",
              color: kColorSecondary,
              onPress: () => Navigator.pushNamed(context, CentresDashboard.id),
            ),
          ],
        ));
  }
}

class GridButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onPress;
  GridButton({required this.title, required this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              color: color,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPress,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
