import 'package:flutter/material.dart';
import 'package:fitwego/screens/onboarding_bodyfat.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

class OnboardingWeight extends StatefulWidget {
  const OnboardingWeight({super.key});

  @override
  State<OnboardingWeight> createState() => _OnboardingWeightState();
}

class _OnboardingWeightState extends State<OnboardingWeight> {
  double weight = 70;

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
              "What's your weight?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "We'll track your progress over time",
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const Spacer(),

            Center(
              child: Column(
                children: [
                  Text(
                    weight.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "kilograms",
                    style: TextStyle(fontSize: 13, color: AppTheme.textGrey),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Slider(
              value: weight,
              min: 30,
              max: 200,
              activeColor: AppTheme.primaryBlue,
              inactiveColor: Colors.grey.shade800,
              onChanged: (val) {
                setState(() {
                  weight = val;
                });
              },
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              text: "Next",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingBodyFat()),
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