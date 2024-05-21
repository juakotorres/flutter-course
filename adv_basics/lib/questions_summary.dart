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
          children: summaryData.map((summary) {
            final answeredCorrectly =
                summary['user_answer'] == summary['correct_answer'];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: answeredCorrectly
                        ? const Color.fromARGB(255, 127, 206, 234)
                        : const Color.fromARGB(255, 255, 145, 163),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    ((summary['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        summary['question'] as String,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        summary['user_answer'] as String,
                        style: GoogleFonts.montserrat(
                          color: const Color.fromARGB(255, 229, 193, 255),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        summary['correct_answer'] as String,
                        style: GoogleFonts.montserrat(
                          color: const Color.fromARGB(255, 179, 195, 255),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
