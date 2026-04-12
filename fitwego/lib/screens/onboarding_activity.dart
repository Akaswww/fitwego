import 'package:flutter/material.dart';
import 'package:fitwego/screens/onboarding_complete.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/select_card.dart';

class OnboardingActivity extends StatefulWidget {
  const OnboardingActivity({super.key});

  @override
  State<OnboardingActivity> createState() => _OnboardingActivityState();
}

class _OnboardingActivityState extends State<OnboardingActivity> {
  String selected = "Sedentary";

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
              "Activity level",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "How active are you daily?",
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const SizedBox(height: 30),

            SelectCard(
              title: "Sedentary",
              subtitle: "Little/no exercise, mostly sitting",
              selected: selected == "Sedentary",
              onTap: () => setState(() => selected = "Sedentary"),
            ),
            SelectCard(
              title: "Lightly Active",
              subtitle: "Light exercise 1-3 days/week",
              selected: selected == "Lightly Active",
              onTap: () => setState(() => selected = "Lightly Active"),
            ),
            SelectCard(
              title: "Moderately Active",
              subtitle: "Moderate exercise 3-5 days/week",
              selected: selected == "Moderately Active",
              onTap: () => setState(() => selected = "Moderately Active"),
            ),
            SelectCard(
              title: "Very Active",
              subtitle: "Hard exercise 6-7 days/week",
              selected: selected == "Very Active",
              onTap: () => setState(() => selected = "Very Active"),
            ),
            SelectCard(
              title: "Extra Active",
              subtitle: "Very intense daily activity",
              selected: selected == "Extra Active",
              onTap: () => setState(() => selected = "Extra Active"),
            ),

            const Spacer(),

            PrimaryButton(
              text: "Next",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingComplete()),
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