class HealthScoreData {
  final int score;
  final String status;
  final String message;

  const HealthScoreData({
    required this.score,
    required this.status,
    required this.message,
  });
}

class MacroData {
  final String name;
  final int currentGrams;
  final int goalGrams;

  const MacroData({
    required this.name,
    required this.currentGrams,
    required this.goalGrams,
  });

  double get progress => (currentGrams / goalGrams).clamp(0.0, 1.0);
}

class NutritionSummaryData {
  final int currentCalories;
  final int goalCalories;
  final MacroData protein;
  final MacroData carbs;
  final MacroData fat;

  const NutritionSummaryData({
    required this.currentCalories,
    required this.goalCalories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  int get progressPercentage =>
      ((currentCalories / goalCalories) * 100).round();
  double get progressRatio =>
      (currentCalories / goalCalories).clamp(0.0, 1.0);
}

class AiSuggestionData {
  final String title;
  final String description;
  final String? imageUrl;

  const AiSuggestionData({
    required this.title,
    required this.description,
    this.imageUrl,
  });
}
