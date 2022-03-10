import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/controllers/question_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class ScoreScreen extends StatefulWidget {
  static const String id = "score_screen";
  final kSubject subject;
  const ScoreScreen({Key? key, required this.subject}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.delete<QuestionController>();
  }

  @override
  Widget build(BuildContext context) {
    dynamic subject = Get.arguments[0];
    dynamic correctAnswer = Get.arguments[1];
    QuestionController _controller =
        Get.put(QuestionController(subject, context));
    int subCode = 1;
    if (_controller.sub == kSubject.sub1) {
      subCode = 1;
    } else if (_controller.sub == kSubject.sub2) {
      subCode = 2;
    } else {
      subCode = 3;
    }
    return Scaffold(
      backgroundColor: kQuizBackgroundColors,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              "Score",
              style: TextStyle(
                color: Colors.white,
                fontSize: 64,
              ),
            ),
            Text(
              "${_controller.numOfCorrectAns * 10}/${_controller.questions.length * 10}",
              style: TextStyle(
                fontSize: 42,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Text(
              (_controller.numOfCorrectAns > 6)
                  ? "CONGRATULATIONS!🥳"
                  : "Oops, Try Again!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            (_controller.numOfCorrectAns > 6)
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/subject$subCode.png'),
                  )
                : SizedBox.shrink(),
            (_controller.numOfCorrectAns > 6)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kColorSecondary),
                        ),
                        onPressed: () async {
                          await Permission.storage.request();
                          await Permission.manageExternalStorage.request();
                          final doc = pw.Document();
                          final image = pw.MemoryImage((await rootBundle
                                  .load("assets/subject$subCode.png"))
                              .buffer
                              .asUint8List());
                          doc.addPage(
                            pw.Page(
                              pageFormat: PdfPageFormat.a4,
                              build: (pw.Context context) {
                                return pw.Column(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Center(
                                      child: pw.Image(image),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                          final outPut = await getExternalStorageDirectory();
                          String path = outPut!.path +
                              '/sub${subCode}certific'
                                  'ate.pdf';
                          final file = File(path);
                          file.writeAsBytesSync(await doc.save());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Saved at ${outPut.path}")));
                        },
                        child: Text("Download PDF"),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kColorPrimary),
                  ),
                  onPressed: () {
                    Get.back();
                    Get.delete<QuestionController>();
                  },
                  child: Text("Try Again"),
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
