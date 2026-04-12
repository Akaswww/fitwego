import 'package:flutter/material.dart';
import 'package:fitwego/screens/onboarding_weight.dart';
import '../theme/app_theme.dart';
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
              "What's your height?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "Choose your preferred unit",
              style: TextStyle(fontSize: 12, color: AppTheme.textGrey),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isCm = true),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: isCm ? AppTheme.primaryBlue : AppTheme.cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "CM",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isCm ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isCm = false),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: !isCm ? AppTheme.primaryBlue : AppTheme.cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "FOOT",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: !isCm ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Center(
              child: Column(
                children: [
                  Text(
                    isCm
                        ? heightCm.toInt().toString()
                        : heightFoot.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isCm ? "centimeters" : "foot",
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

            const SizedBox(height: 20),

            PrimaryButton(
              text: "Next",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingWeight()),
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