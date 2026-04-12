import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SelectCard extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final String? subtitle;

  const SelectCard({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryBlue.withOpacity(0.12) : AppTheme.cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppTheme.primaryBlue : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textGrey,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}