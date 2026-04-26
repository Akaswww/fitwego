import 'package:flutter/material.dart';
import 'package:fitwego/screens/exercise_screen.dart';
import 'package:fitwego/screens/login_screen.dart';
import 'package:fitwego/screens/main_nav_screen.dart';
import 'package:fitwego/screens/onboarding_activity.dart';
import 'package:fitwego/screens/onboarding_age.dart';
import 'package:fitwego/screens/onboarding_bodyfat.dart';
import 'package:fitwego/screens/onboarding_complete.dart';
import 'package:fitwego/screens/onboarding_gender.dart';
import 'package:fitwego/screens/onboarding_height.dart';
import 'package:fitwego/screens/onboarding_weight.dart';
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
      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginScreen(),
        '/onboarding-gender': (context) => const OnboardingGender(),
        '/onboarding-age': (context) => const OnboardingAge(),
        '/onboarding-height': (context) => const OnboardingHeight(),
        '/onboarding-weight': (context) => const OnboardingWeight(),
        '/onboarding-bodyfat': (context) => const OnboardingBodyFat(),
        '/onboarding-activity': (context) => const OnboardingActivity(),
        '/onboarding-complete': (context) => const OnboardingComplete(),
        '/main': (context) => const MainNavScreen(),
        '/exercise': (context) => const ExerciseScreen(),
      },
    );
  }
}
