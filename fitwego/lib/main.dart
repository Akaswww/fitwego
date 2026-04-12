import 'package:flutter/material.dart';
import 'package:fitwego/screens/login_screen.dart';
import 'package:fitwego/screens/onboarding_gender.dart';
import 'package:fitwego/screens/exercise_screen.dart';
import 'package:fitwego/theme/app_theme.dart';

void main() {
  runApp(const FitWeGoApp());
}

class FitWeGoApp extends StatelessWidget {
  const FitWeGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FitWeGo",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      initialRoute: '/exercise',

      routes: {
        '/login': (context) => const LoginScreen(),
        '/onboarding-gender': (context) => const OnboardingGender(),
        '/exercise': (context) => const ExerciseScreen(),
      },
    );
  }
}