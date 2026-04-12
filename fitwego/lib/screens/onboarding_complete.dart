import 'package:flutter/material.dart';
import 'package:fitwego/screens/main_nav_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

class OnboardingComplete extends StatelessWidget {
  const OnboardingComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1F3B2E),
              ),
              child: const Icon(
                Icons.check,
                size: 34,
                color: Colors.greenAccent,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "You're all set!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your personalized fitness journey starts\nnow",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const Spacer(),

            PrimaryButton(
              text: "Go to Home",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainNavScreen()),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}