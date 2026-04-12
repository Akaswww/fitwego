class SetData {
  final int setNumber;
  final int reps;
  final double weight;
  final int? previousReps;
  final double? previousWeight;

  SetData({
    required this.setNumber,
    required this.reps,
    required this.weight,
    this.previousReps,
    this.previousWeight,
  });
}