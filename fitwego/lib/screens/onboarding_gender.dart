import 'package:flutter/material.dart';
import '../widgets/onboarding_scaffold.dart';
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
    return OnboardingScaffold(
      progress: 1 / 6,
      title: 'Select your gender',
      subtitle: 'This helps us personalize your experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectCard(
            title: 'Male',
            selected: selected == 'Male',
            onTap: () => setState(() => selected = 'Male'),
          ),
          SelectCard(
            title: 'Female',
            selected: selected == 'Female',
            onTap: () => setState(() => selected = 'Female'),
          ),
          SelectCard(
            title: 'Other',
            selected: selected == 'Other',
            onTap: () => setState(() => selected = 'Other'),
          ),
          const Spacer(),
        ],
      ),
      footer: PrimaryButton(
        text: 'Next',
        onTap: () {
          Navigator.pushNamed(context, '/onboarding-age');
        },
      ),
    );
  }
}
