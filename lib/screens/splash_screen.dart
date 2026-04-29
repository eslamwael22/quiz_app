import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'quiz_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const QuizScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/undraw_quiz_zvhe.png', width: 280.w, height: 280.h),
            SizedBox(height: 20.h),
            Text(
              'Football Quiz',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Test your football knowledge!',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40.h),
            SpinKitThreeBounce(
              color: Colors.black,
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}