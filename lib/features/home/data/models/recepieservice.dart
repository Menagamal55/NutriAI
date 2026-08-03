import 'package:dio/dio.dart';

import 'package:menna/features/home/data/models/reciepemodel.dart';


class SpoonacularService {

  final Dio dio;

  SpoonacularService(this.dio);


  Future<List<RecipeModel>> getRecipes() async {

    final response = await dio.get(

      "https://api.spoonacular.com/recipes/findByNutrients",

      queryParameters: {

        "apiKey": "6dfce30452bd4c7b9f190bef943b50d2",

        "maxCalories": 600,

        "minProtein": 20,

        "number": 10,

      },

    );


    return (response.data as List)
        .map(
          (json) => RecipeModel.fromJson(json),
        )
        .toList();

  }
}