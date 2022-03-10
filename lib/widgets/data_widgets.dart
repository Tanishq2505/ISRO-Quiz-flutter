import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';

Widget loadingView() => const Center(
      child: CircularProgressIndicator(
        backgroundColor: kColorPrimary,
      ),
    );
Widget noDataView(String msg) => Center(
      child: Text(
        msg,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      ),
    );
