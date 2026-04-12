import 'package:flutter/material.dart';
import 'package:fitwego/screens/onboarding_age.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/select_card.dart';

class OnboardingGender extends StatefulWidget {
  const OnboardingGender({super.key});

  @override
  State<OnboardingGender> createState() => _OnboardingGenderState();
}

class _OnboardingGenderState extends State<OnboardingGender> {
  String selected = "Male";

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
              "Select your gender",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "This helps us personalize your experience",
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const SizedBox(height: 35),

            SelectCard(
              title: "Male",
              selected: selected == "Male",
              onTap: () => setState(() => selected = "Male"),
            ),
            SelectCard(
              title: "Female",
              selected: selected == "Female",
              onTap: () => setState(() => selected = "Female"),
            ),
            SelectCard(
              title: "Other",
              selected: selected == "Other",
              onTap: () => setState(() => selected = "Other"),
            ),

            const Spacer(),

            PrimaryButton(
              text: "Next",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingAge()),
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