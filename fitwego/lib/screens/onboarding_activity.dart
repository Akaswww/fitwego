import 'package:flutter/material.dart';
import '../widgets/onboarding_scaffold.dart';
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
    return OnboardingScaffold(
      progress: 1,
      title: 'Activity level',
      subtitle: 'How active are you daily?',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectCard(
              title: 'Sedentary',
              subtitle: 'Little/no exercise, mostly sitting',
              selected: selected == 'Sedentary',
              onTap: () => setState(() => selected = 'Sedentary'),
            ),
            SelectCard(
              title: 'Lightly Active',
              subtitle: 'Light exercise 1-3 days/week',
              selected: selected == 'Lightly Active',
              onTap: () => setState(() => selected = 'Lightly Active'),
            ),
            SelectCard(
              title: 'Moderately Active',
              subtitle: 'Moderate exercise 3-5 days/week',
              selected: selected == 'Moderately Active',
              onTap: () => setState(() => selected = 'Moderately Active'),
            ),
            SelectCard(
              title: 'Very Active',
              subtitle: 'Hard exercise 6-7 days/week',
              selected: selected == 'Very Active',
              onTap: () => setState(() => selected = 'Very Active'),
            ),
            SelectCard(
              title: 'Extra Active',
              subtitle: 'Very intense daily activity',
              selected: selected == 'Extra Active',
              onTap: () => setState(() => selected = 'Extra Active'),
            ),
          ],
        ),
      ),
      footer: PrimaryButton(
        text: 'Next',
        onTap: () {
          Navigator.pushNamed(context, '/onboarding-complete');
        },
      ),
    );
  }
}
