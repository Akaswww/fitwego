import 'package:flutter/material.dart';
import 'package:fitwego/screens/onboarding_height.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

class OnboardingAge extends StatefulWidget {
  const OnboardingAge({super.key});

  @override
  State<OnboardingAge> createState() => _OnboardingAgeState();
}

class _OnboardingAgeState extends State<OnboardingAge> {
  double age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),

            Container(height: 3, width: 70, color: AppTheme.primaryBlue),

            const SizedBox(height: 25),
            const Text(
              "What's your age?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "We'll use this to calculate your needs",
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const Spacer(),

            Center(
              child: Column(
                children: [
                  Text(
                    age.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "years old",
                    style: TextStyle(fontSize: 13, color: AppTheme.textGrey),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Slider(
              value: age,
              min: 10,
              max: 80,
              activeColor: AppTheme.primaryBlue,
              inactiveColor: Colors.grey.shade800,
              onChanged: (val) {
                setState(() {
                  age = val;
                });
              },
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              text: "Next",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingHeight()),
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
