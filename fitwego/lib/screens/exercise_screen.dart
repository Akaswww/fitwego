import 'package:flutter/material.dart';

import '../data/exercise_catalog.dart';
import '../data/mock_exercises.dart';
import '../models/exercise_model.dart';
import '../models/set_model.dart';
import '../theme/app_theme.dart';
import '../widgets/exercise_card.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late final List<Exercise> _exercises;

  @override
  void initState() {
    super.initState();
    _exercises = mockExercises
        .map(
          (exercise) => Exercise(
            name: exercise.name,
            muscle: exercise.muscle,
            sets: exercise.sets
                .map(
                  (set) => SetData(
                    setNumber: set.setNumber,
                    reps: set.reps,
                    weight: set.weight,
                    previousReps: set.previousReps,
                    previousWeight: set.previousWeight,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  Future<void> _openExerciseEditor({Exercise? exercise, int? index}) async {
    final nameController = TextEditingController(text: exercise?.name ?? '');
    final muscleController = TextEditingController(text: exercise?.muscle ?? '');
    String? selectedExerciseName = exerciseCatalog.any((item) => item.name == exercise?.name)
        ? exercise!.name
        : null;
    String? selectedMuscle = targetMuscleOptions.contains(exercise?.muscle) ? exercise!.muscle : null;
    final setControllers = (exercise?.sets ??
            const [
              SetData(setNumber: 1, reps: 10, weight: 20, previousReps: 0),
            ])
        .map(
          (set) => _EditableSetControllers(
            repsController: TextEditingController(text: set.reps.toString()),
            weightController: TextEditingController(
              text: set.weight.truncateToDouble() == set.weight
                  ? set.weight.toInt().toString()
                  : set.weight.toString(),
            ),
            previousReps: set.previousReps,
            previousWeight: set.previousWeight,
          ),
        )
        .toList();

    final result = await showDialog<Exercise>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: AppTheme.cardColor,
              title: Text(
                exercise == null ? 'Add Exercise' : 'Edit Exercise',
                style: const TextStyle(color: Colors.white),
              ),
              content: SizedBox(
                width: 420,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedExerciseName,
                        dropdownColor: AppTheme.cardColor,
                        decoration: const InputDecoration(
                          labelText: 'Suggested exercise',
                          labelStyle: TextStyle(color: AppTheme.textGrey),
                        ),
                        items: exerciseCatalog
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(
                                  item.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedExerciseName = value;
                            if (value == null) {
                              return;
                            }
                            final selectedItem = exerciseCatalog.firstWhere(
                              (item) => item.name == value,
                            );
                            nameController.text = selectedItem.name;
                            muscleController.text = selectedItem.muscle;
                            selectedMuscle = selectedItem.muscle;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Exercise name',
                          labelStyle: TextStyle(color: AppTheme.textGrey),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedMuscle,
                        dropdownColor: AppTheme.cardColor,
                        decoration: const InputDecoration(
                          labelText: 'Target muscle',
                          labelStyle: TextStyle(color: AppTheme.textGrey),
                        ),
                        items: targetMuscleOptions
                            .map(
                              (muscle) => DropdownMenuItem<String>(
                                value: muscle,
                                child: Text(
                                  muscle,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedMuscle = value;
                            muscleController.text = value ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            'Sets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: () {
                              setDialogState(() {
                                setControllers.add(
                                  _EditableSetControllers(
                                    repsController: TextEditingController(text: '10'),
                                    weightController: TextEditingController(text: '20'),
                                  ),
                                );
                              });
                            },
                            icon: const Icon(Icons.add, size: 18, color: AppTheme.primaryBlue),
                            label: const Text(
                              'Add set',
                              style: TextStyle(color: AppTheme.primaryBlue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...List.generate(setControllers.length, (setIndex) {
                        final setController = setControllers[setIndex];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF242424),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Set ${setIndex + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (setControllers.length > 1)
                                    IconButton(
                                      onPressed: () {
                                        setDialogState(() {
                                          final removed = setControllers.removeAt(setIndex);
                                          removed.dispose();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.white70,
                                        size: 20,
                                      ),
                                      tooltip: 'Remove set',
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: setController.weightController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  labelText: 'Weight (kg)',
                                  labelStyle: TextStyle(color: AppTheme.textGrey),
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: setController.repsController,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  labelText: 'Reps',
                                  labelStyle: TextStyle(color: AppTheme.textGrey),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel', style: TextStyle(color: AppTheme.textGrey)),
                ),
                FilledButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final muscle = muscleController.text.trim();
                    if (name.isEmpty || muscle.isEmpty) {
                      return;
                    }

                    final parsedSets = <SetData>[];
                    for (var i = 0; i < setControllers.length; i++) {
                      final reps = int.tryParse(setControllers[i].repsController.text.trim());
                      final weight = double.tryParse(setControllers[i].weightController.text.trim());
                      if (reps == null || weight == null) {
                        return;
                      }

                      final originalSet = exercise != null && i < exercise.sets.length
                          ? exercise.sets[i]
                          : null;

                      parsedSets.add(
                        SetData(
                          setNumber: i + 1,
                          reps: reps,
                          weight: weight,
                          previousReps: originalSet?.previousReps ?? setControllers[i].previousReps,
                          previousWeight:
                              originalSet?.previousWeight ?? setControllers[i].previousWeight,
                        ),
                      );
                    }

                    Navigator.pop(
                      dialogContext,
                      Exercise(
                        name: name,
                        muscle: muscle,
                        sets: parsedSets,
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(backgroundColor: AppTheme.primaryBlue),
                  child: Text(
                    exercise == null ? 'Add' : 'Save',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    nameController.dispose();
    muscleController.dispose();
    for (final setController in setControllers) {
      setController.dispose();
    }

    if (result == null) {
      return;
    }

    setState(() {
      if (index == null) {
        _exercises.add(result);
      } else {
        _exercises[index] = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
              return;
            }
            Navigator.pushReplacementNamed(context, '/main');
          },
        ),
        actions: [
          IconButton(
            onPressed: () => _openExerciseEditor(),
            icon: const Icon(Icons.add, color: Colors.white),
            tooltip: 'Add exercise',
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _exercises.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Text(
                'Exercise',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              );
            }
            if (index == 1) {
              return const SizedBox(height: 20);
            }
            return ExerciseCard(
              exercise: _exercises[index - 2],
              compact: true,
              onEdit: () => _openExerciseEditor(
                exercise: _exercises[index - 2],
                index: index - 2,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EditableSetControllers {
  _EditableSetControllers({
    required this.repsController,
    required this.weightController,
    this.previousReps,
    this.previousWeight,
  });

  final TextEditingController repsController;
  final TextEditingController weightController;
  final int? previousReps;
  final double? previousWeight;

  void dispose() {
    repsController.dispose();
    weightController.dispose();
  }
}
