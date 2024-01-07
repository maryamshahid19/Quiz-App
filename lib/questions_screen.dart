import 'package:flutter/material.dart';
import 'package:third_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      //alternative of using centered widget
      width: double.infinity, //whole screen will have the color set
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text, //1st question will be displayed in text
              style: GoogleFonts.gabriela(
                color: const Color.fromARGB(255, 175, 219, 212),
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              //maps the answers list one by one on answer button
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  nextQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
