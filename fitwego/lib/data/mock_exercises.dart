import '../models/exercise_model.dart';
import '../models/set_model.dart';

const List<Exercise> mockExercises = [
  Exercise(
    name: 'Bench Press',
    muscle: 'Chest',
    sets: [
      SetData(setNumber: 1, reps: 12, weight: 40, previousReps: 10),
      SetData(setNumber: 2, reps: 10, weight: 45, previousReps: 10),
      SetData(setNumber: 3, reps: 8, weight: 50, previousReps: 8),
    ],
  ),
];
