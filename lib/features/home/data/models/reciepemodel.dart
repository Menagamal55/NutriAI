class RecipeModel {
  final int id;
  final String title;
  final String image;
  final int calories;
  final String protein;
  final String fat;
  final String carbs;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });


  factory RecipeModel.fromJson(Map<String, dynamic> json) {

    return RecipeModel(

      id: json['id'] ?? 0,

      title: json['title'] ?? '',

      image: json['image'] ?? '',

      calories: json['calories'] ?? 0,

      protein: json['protein']?.toString() ?? '0g',

      fat: json['fat']?.toString() ?? '0g',

      carbs: json['carbs']?.toString() ?? '0g',

    );
  }
}