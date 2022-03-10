import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/models/question.dart';

import '../screens/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  final kSubject sub;
  final BuildContext context;
  QuestionController(this.sub, this.context) {
    if (sub == kSubject.sub1) {
      _questions = [
        Question(
          "Where is the Headquarters of the Indian Space Research "
              "Organisation (ISRO)?",
          "Banglore",
          ["Pune", "Banglore", "Lucknow", "Mumbai"],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "When was ISRO formed?",
          "15 August 1969",
          [
            "15 August 1947",
            "15 August 1952",
            "15 August 1969",
            "15 August 1967"
          ],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "What is the Full Form of SDSC?",
          "Satish Dhawan Space Centre",
          [
            "Satish Development Space Centre",
            "Scientific Development Space Centre",
            "Satish Dhawan Space Centre",
            "Static Development Space Centre"
          ],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "Who is the Owner of the Indian Space Research Organisation?",
          "Department of Space",
          [
            "Department of Space",
            "Department of State",
            "Distributed Operating Space",
            "Dioctyl Sebacate"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Which Satellite is responsible for Communication, Meteorological Services, and Television Broadcasting in India?",
          "INSAT",
          ["IRS", "INSATTP", "INPUT", "INSAT"],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "What is the Full Form of PSLV?",
          "Polar Satellite Launch Vehicle",
          [
            "Public Satellite Launch Vehicle",
            "Polar Satellite Launch Vehicle",
            "Polar Service Launch Vehicle",
            "Public Service Launch Vehicle"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "When was the First Rocket launched from India?",
          "21 November 1963",
          [
            "21 December 1963",
            "21 October 1963",
            "21 November 1964",
            "21 November 1963"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "What was ISRO known before 1969?",
          "INCOSPAR",
          ["INCOSPAR", "ACROSS", "DAE", "INSA"],
          kQuestionLevel.Hard,
          50,
        ),
        Question(
          "Where is the Indian Institute of Remote Sensing (IIRS)?",
          "Dehradun",
          ["Hyderabad", "Dehradun", "Ahmedabad", "Sriharikota"],
          kQuestionLevel.Hard,
          50,
        ),
        Question(
          "Which Satellite is used for Resources Monitoring and Management by ISRO?",
          "IRS",
          ["IRIS", "INSAT", "IRS", "ISS"],
          kQuestionLevel.Hard,
          50,
        ),
      ];
    } else if (sub == kSubject.sub2) {
      _questions = [
        Question(
          "What is the Full Form of GSLV?",
          "Geosynchronous Satellite Launch Vehicle",
          [
            "Global Satellite Launch Vehicle",
            "Geosynchronous Service Launch Vehicle",
            "Geosynchronous Satellite Launch Vehicle",
            "Geo Satellite Launch Vehicle"
          ],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "Who is the Father of the Indian Space Program?",
          "Vikram Sarabhai",
          [
            "C. V. Raman",
            "Vikram Sarabhai",
            "M. G. K. Menon",
            "A. P. J. Abdul Kalam"
          ],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "A material is Dimensionally Stable at room temperature if its Glass Transition Temperature (Tg) is?",
          "Well Above Room Temperature",
          [
            "Below Room Temperature",
            "Well Above Room Temperature",
            "Just Above Temperature",
            "Equal To Room Temperature"
          ],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "When was Chandrayaan-1 launched?",
          "22 October 2008",
          [
            "22 October 2018",
            "22 October 2006",
            "22 October 2008",
            "22 October 2010"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "When was Chandrayaan-2 launched?",
          "22 July 2019",
          ["22 July 2018", "22 July 2019", "22 July 2020", "22 July 2015"],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Where was Chandrayaan-2 launched?",
          "Satish Dhawan Space Centre Second LaunchPad",
          [
            "ISRO Satellite Centre",
            "Satish Dhawan Space Centre First LaunchPad",
            "Satish Dhawan Space Centre Second LaunchPad",
            "Laboratory for Electro-Optics Systems"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Who was elected as the Chairman of the Indian Space Research Organisation on 15 January 2018?",
          "K. Sivan",
          [
            "Shailesh Nayak",
            "K. Sivan",
            "A. S. Kiran Kumar",
            "K. Radhakrishnan"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Name the First Satellite built by India?",
          "Aryabhata",
          ["Rohini RS-1", "Aryabhata", "Chandrayaan-1", "SPADEX"],
          kQuestionLevel.Hard,
          50,
        ),
        Question(
          "Which Satellite made India the First Nation to Succeed on its Maiden Attempt to Mars?",
          "Mangalyaan",
          ["Rohini", "Aryabhatta", "Mangalyaan", "Chandrayaan-1"],
          kQuestionLevel.Hard,
          50,
        ),
        Question(
          "Who was the First Chairman of the Indian National Committee for Space Research (INCOSPAR)?",
          "Vikram Sarabhai",
          ["Vikram Sarabhai", "M. G. K. Menon", "Satish Dhawan", "K. Sivan"],
          kQuestionLevel.Hard,
          50,
        ),
      ];
    } else {
      _questions = [
        Question(
          "Who is known as the Missile Man of India?",
          "A. P. J. Abdul Kalam",
          [
            "Satyendra Nath Bose",
            "Vikram Sarabhai",
            "C.V. Raman",
            "A. P. J. Abdul Kalam"
          ],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "Which Missile was developed Under A. P. J. Abdul Kalam’s Guidance?",
          "Prithvi",
          ["K15", "MPATGM", "Prithvi", "Surya"],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "Which is the First Successful Nuclear Bomb Test by India on 18 May 1974?",
          "Smiling Buddha",
          ["Pokhran-II", "Smiling Buddha", "Angry Bird", "PTR"],
          kQuestionLevel.Easy,
          10,
        ),
        Question(
          "When was the Indian National Committee for Space Research (INCOSPAR) Set Up?",
          "1962",
          ["1962", "1965", "1947", "1947"],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "What is the Name of the Indian Space University?",
          "Indian Institute of Space Science & Technology (IIST)",
          [
            "Physical Research Laboratory (PRL)",
            "Indian Institute of Science (IISc)",
            "Indian Institute of Remote Sensing (IIRS)",
            "Indian Institute of Space Science & Technology (IIST)"
          ],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Where is Vikram Sarabhai Space Centre?",
          "Thiruvananthapuram",
          ["Ahmedabad", "Chandigarh", "Thiruvananthapuram", "Mohali"],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Which Satellite is used by Tata Sky?",
          "INSAT-4A",
          ["CartoSat-1", "INSAT-4CR", "INSAT-99", "INSAT-4A"],
          kQuestionLevel.Medium,
          20,
        ),
        Question(
          "Which Series of Indian Satellites are Decommissioned?",
          "ASLV",
          ["ASLV", "PSLV", "GSLV", "GSLV Mk III"],
          kQuestionLevel.Hard,
          50,
        ),
        Question(
          "How many Polar Satellite Launch Vehicle (PSLV) failed during the 1990s?",
          "1",
          ["4", "3", "0", "1"],
          kQuestionLevel.Hard,
          50,
        ),
        Question(
          "When did Chandrayaan-1 Enter the Mars orbit?",
          "24 September 2014",
          [
            "24 September 2019",
            "24 September 2014",
            "24 September 2008",
            "24 September 2018"
          ],
          kQuestionLevel.Hard,
          50,
        ),
      ];
    }
  }
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  kSubject get controllerSubject => this.sub;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  late List<Question> _questions;
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.options.indexOf(question.questionAnswer);
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.offNamed(ScoreScreen.id, arguments: [sub, numOfCorrectAns]);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
