import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';
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
    return OnboardingScaffold(
      progress: 4 / 6,
      title: "What's your weight?",
      subtitle: "We'll track your progress over time",
      child: Column(
        children: [
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
                  'kilograms',
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
            onChanged: (val) => setState(() => weight = val),
          ),
        ],
      ),
      footer: PrimaryButton(
        text: 'Next',
        onTap: () {
          Navigator.pushNamed(context, '/onboarding-bodyfat');
        },
      ),
    );
  }
}
