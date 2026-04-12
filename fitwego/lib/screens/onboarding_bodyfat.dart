import 'package:flutter/material.dart';
import 'package:fitwego/screens/onboarding_activity.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

class OnboardingBodyFat extends StatefulWidget {
  const OnboardingBodyFat({super.key});

  @override
  State<OnboardingBodyFat> createState() => _OnboardingBodyFatState();
}

class _OnboardingBodyFatState extends State<OnboardingBodyFat> {
  double fat = 18;

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
              "Body fat percentage",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "Optional - helps with more accurate tracking",
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const Spacer(),

            Center(
              child: Column(
                children: [
                  Text(
                    fat.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "percent",
                    style: TextStyle(fontSize: 13, color: AppTheme.textGrey),
                  ),
                ],
              ),
            ),

            const Spacer(),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingActivity()),
                );
              },
              child: const Text(
                "Skip this step",
                style: TextStyle(color: AppTheme.primaryBlue),
              ),
            ),

            Slider(
              value: fat,
              min: 5,
              max: 50,
              activeColor: AppTheme.primaryBlue,
              inactiveColor: Colors.grey.shade800,
              onChanged: (val) {
                setState(() {
                  fat = val;
                });
              },
            ),

            const SizedBox(height: 15),

            PrimaryButton(
              text: "Next",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingActivity()),
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