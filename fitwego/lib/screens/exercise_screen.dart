import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../models/set_model.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final exercises = [
      Exercise(
        name: "Bench Press",
        muscle: "Chest",
        sets: [
          SetData(setNumber: 1, reps: 12, weight: 40, previousReps: 10),
          SetData(setNumber: 2, reps: 10, weight: 45, previousReps: 10),
          SetData(setNumber: 3, reps: 8, weight: 50, previousReps: 8),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            const Text(
              "Exercise",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),

            const SizedBox(height: 20),

            ...exercises.map((e) => _exerciseCard(e)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _exerciseCard(Exercise e) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(e.name, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Text(e.muscle, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Set", style: TextStyle(color: Colors.grey)),
              Text("KG", style: TextStyle(color: Colors.grey)),
              Text("Reps", style: TextStyle(color: Colors.grey)),
              Text("Prev", style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 8),

          Column(
            children: e.sets.map((s) => _setRow(s)).toList(),
          )
        ],
      ),
    );
  }

  Widget _setRow(SetData s) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${s.setNumber}", style: const TextStyle(color: Colors.white)),
          Text("${s.weight} kg", style: const TextStyle(color: Colors.white)),
          Text("${s.reps}", style: const TextStyle(color: Colors.white)),
          Text("${s.previousReps ?? "-"}",
              style: const TextStyle(color: Colors.cyan)),
        ],
      ),
    );
  }
}