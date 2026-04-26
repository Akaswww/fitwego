import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';
import '../widgets/primary_button.dart';

class OnboardingHeight extends StatefulWidget {
  const OnboardingHeight({super.key});

  @override
  State<OnboardingHeight> createState() => _OnboardingHeightState();
}

class _OnboardingHeightState extends State<OnboardingHeight> {
  double heightCm = 175;
  double heightFoot = 5.5;
  bool isCm = true;

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      progress: 3 / 6,
      title: "What's your height?",
      subtitle: 'Choose your preferred unit',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _UnitToggle(
                  label: 'CM',
                  selected: isCm,
                  onTap: () => setState(() => isCm = true),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _UnitToggle(
                  label: 'FOOT',
                  selected: !isCm,
                  onTap: () => setState(() => isCm = false),
                ),
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Text(
                  isCm ? heightCm.toInt().toString() : heightFoot.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isCm ? 'centimeters' : 'foot',
                  style: const TextStyle(fontSize: 13, color: AppTheme.textGrey),
                ),
              ],
            ),
          ),
          const Spacer(),
          Slider(
            value: isCm ? heightCm : heightFoot,
            min: isCm ? 100 : 3.0,
            max: isCm ? 220 : 8.0,
            divisions: isCm ? 120 : 50,
            activeColor: AppTheme.primaryBlue,
            inactiveColor: Colors.grey.shade800,
            onChanged: (val) {
              setState(() {
                if (isCm) {
                  heightCm = val;
                } else {
                  heightFoot = val;
                }
              });
            },
          ),
        ],
      ),
      footer: PrimaryButton(
        text: 'Next',
        onTap: () {
          Navigator.pushNamed(context, '/onboarding-weight');
        },
      ),
    );
  }
}

class _UnitToggle extends StatelessWidget {
  const _UnitToggle({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 42,
          decoration: BoxDecoration(
            color: selected ? AppTheme.primaryBlue : AppTheme.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
