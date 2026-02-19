import 'package:flutter/material.dart';
import 'package:hello_test/data/questions.dart';
import 'package:hello_test/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;

  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // warna tombol
                foregroundColor: Colors.white, // warna teks & ikon
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
