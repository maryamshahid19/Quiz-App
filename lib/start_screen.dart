import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            //can wrap this up in another widget of opacity
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 125, 199, 189),
          ),
          const SizedBox(height: 50),
          const Text(
            'Learn flutter the fun way',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: changeScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white38,
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
