import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';
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
    return OnboardingScaffold(
      progress: 2 / 6,
      title: "What's your age?",
      subtitle: "We'll use this to calculate your needs",
      child: Column(
        children: [
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
                  'years old',
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
            onChanged: (val) => setState(() => age = val),
          ),
        ],
      ),
      footer: PrimaryButton(
        text: 'Next',
        onTap: () {
          Navigator.pushNamed(context, '/onboarding-height');
        },
      ),
    );
  }
}
