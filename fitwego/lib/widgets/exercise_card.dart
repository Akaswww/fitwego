import 'package:flutter/material.dart';

import '../models/exercise_model.dart';
import '../models/set_model.dart';
import '../theme/app_theme.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
    this.compact = false,
    this.onEdit,
  });

  final Exercise exercise;
  final bool compact;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: compact ? 16 : 18,
                        fontWeight: compact ? FontWeight.w500 : FontWeight.w600,
                      ),
                    ),
                    Text(exercise.muscle, style: const TextStyle(color: AppTheme.textGrey)),
                  ],
                ),
              ),
              if (onEdit != null)
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, color: Colors.white70, size: 20),
                  tooltip: 'Edit exercise',
                ),
            ],
          ),
          const SizedBox(height: 16),
          const _ExerciseHeaderRow(),
          if (!compact) const Divider(color: Colors.white10, height: 20),
          if (compact) const SizedBox(height: 8),
          ...exercise.sets.map(_buildSetRow),
        ],
      ),
    );
  }

  Widget _buildSetRow(SetData setData) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: compact ? 6 : 8),
      child: Row(
        children: [
          _ExerciseCell(text: '${setData.setNumber}', alignment: TextAlign.left),
          _ExerciseCell(
            text: '${setData.weight.toStringAsFixed(setData.weight.truncateToDouble() == setData.weight ? 0 : 1)} kg',
            isHighlighted: !compact,
          ),
          _ExerciseCell(text: '${setData.reps}'),
          _ExerciseCell(
            text: '${setData.previousReps ?? "-"}',
            color: Colors.cyan,
            alignment: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class _ExerciseHeaderRow extends StatelessWidget {
  const _ExerciseHeaderRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _ExerciseCell(text: 'Set', color: AppTheme.textGrey, alignment: TextAlign.left),
        _ExerciseCell(text: 'Weight', color: AppTheme.textGrey),
        _ExerciseCell(text: 'Reps', color: AppTheme.textGrey),
        _ExerciseCell(text: 'Prev', color: AppTheme.textGrey, alignment: TextAlign.right),
      ],
    );
  }
}

class _ExerciseCell extends StatelessWidget {
  const _ExerciseCell({
    required this.text,
    this.color = Colors.white,
    this.alignment = TextAlign.center,
    this.isHighlighted = false,
  });

  final String text;
  final Color color;
  final TextAlign alignment;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: alignment,
        style: TextStyle(
          color: color,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}
