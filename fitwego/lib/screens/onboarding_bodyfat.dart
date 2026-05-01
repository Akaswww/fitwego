import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';
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
    return OnboardingScaffold(
      progress: 5 / 6,
      title: 'Body fat percentage',
      subtitle: 'Optional - helps with more accurate tracking',
      child: Column(
        children: [
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
                  'percent',
                  style: TextStyle(fontSize: 13, color: AppTheme.textGrey),
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/onboarding-activity');
              },
              child: const Text(
                'Skip this step',
                style: TextStyle(color: AppTheme.primaryBlue),
              ),
            ),
          ),
          Slider(
            value: fat,
            min: 5,
            max: 50,
            activeColor: AppTheme.primaryBlue,
            inactiveColor: Colors.grey.shade800,
            onChanged: (val) => setState(() => fat = val),
          ),
        ],
      ),
      footer: PrimaryButton(
        text: 'Next',
        onTap: () {
          Navigator.pushNamed(context, '/onboarding-activity');
        },
      ),
    );
  }
}
