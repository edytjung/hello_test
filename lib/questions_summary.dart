import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nomor soal
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Detail soal
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // rata kiri
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.aBeeZee(
                            color: const Color.fromARGB(255, 255, 217, 0),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Your answer: ${data['user_answer'] as String}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Correct answer: ${data['correct_answer'] as String}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
