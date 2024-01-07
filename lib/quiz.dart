import 'package:flutter/material.dart';
import 'package:third_app/data/question.dart';
import 'package:third_app/questions_screen.dart';
import 'package:third_app/start_screen.dart';
import 'package:third_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  //alternate of ternary approach is commented code
  var activeScreen = 'start-screen'; //ternary approach
  List<String> selectedAnswers = [];

  //@override
  //void initState() {
  //  activeScreen = StartScreen(switchScreen);   //to make sure on pressing button start screen switches to question screen
  //  super.initState();
  //}

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    //if statement approach
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }
    //
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 110, 175, 168),
                Color.fromARGB(255, 3, 117, 105),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,

          //-if // child: activeScreen == 'start-screen'
          //? StartScreen(switchScreen)
          //: const QuestionScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
