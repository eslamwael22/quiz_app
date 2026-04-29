import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  String getFeedback() {
    final percentage = score / totalQuestions;
    if (percentage == 1.0) {
      return 'Excellent! You are a football legend';
    } else if (percentage >= 0.7) {
      return 'Great performance! Football pro';
    } else if (percentage >= 0.5) {
      return 'Good job, but you can improve';
    } else {
      return 'You need to watch more matches';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset('assets/images/undraw_goal_rulh (1).png', width: 200.w, height: 200.h),
              SizedBox(height: 20.h),
              Text(
                'Result',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                '$score / $totalQuestions',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                getFeedback(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40.h),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: Icon(Icons.replay, size: 20.w),
                label: Text(
                  'Play Again',
                  style: TextStyle(fontSize: 16.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 14.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}