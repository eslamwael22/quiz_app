import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/questions_data.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = footballQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedOptionIndex;
  bool answered = false;

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedOptionIndex = index;
      answered = true;
      if (index == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = null;
        answered = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  Color getOptionColor(int index) {
    if (!answered) {
      return Colors.green[700]!;
    }
    if (index == questions[currentQuestionIndex].correctAnswerIndex) {
      return Colors.green;
    }
    if (index == selectedOptionIndex) {
      return Colors.red;
    }
    return Colors.green[700]!;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Football Quiz', style: TextStyle(fontWeight: FontWeight.bold)),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.green[200],
              color: Colors.green[800],
              minHeight: 8.h,
              borderRadius: BorderRadius.circular(4.r),
            ),
            SizedBox(height: 12.h),
            Text(
              'Question ${currentQuestionIndex + 1} / ${questions.length}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.green[800],
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              question.questionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 24.h),
            ...List.generate(question.options.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: ElevatedButton(
                  onPressed: answered ? null : () => selectAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getOptionColor(index),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    question.options[index],
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              );
            }),
            SizedBox(height: 40.h),
            ElevatedButton.icon(
              onPressed: answered ? nextQuestion : null,
                icon: Icon(
                  currentQuestionIndex < questions.length - 1
                      ? Icons.arrow_forward
                      : Icons.check_circle,
                  size: 20.w,
                ),
                label: Text(
                  currentQuestionIndex < questions.length - 1
                      ? 'Next Question'
                      : 'Show Result',
                  style: TextStyle(fontSize: 16.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}