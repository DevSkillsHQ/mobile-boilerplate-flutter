import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile_boilerplate_flutter/data/meal.dart';

class MealService {
  String baseUrl = "https://playground.devskills.co/api/rest/meal-roulette-app";

  Future<List<Meal>> getMeals() async {
    var response =
        await http.get(Uri.parse(baseUrl + "/meals/limit/4/offset/0"));
    if (response.statusCode == 200) {
      Map<String, dynamic> list = json.decode(response.body);
      List<Meal> meals = [];

      for (var meal in list["meal_roulette_app_meals_aggregate"]["nodes"]) {
        meals.add(Meal.fromJson(meal));
      }

      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<List<Meal>> getNextFourMeals(int id) async {
    var response =
        await http.get(Uri.parse(baseUrl + "/meals/limit/4/offset/$id"));
    if (response.statusCode == 200) {
      Map<String, dynamic> list = jsonDecode(response.body);
      List<Meal> meals = [];

      for (var meal in list["meal_roulette_app_meals"]) {
        meals.add(Meal.fromJson(meal));
      }

      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Meal> getMeal(Meal meal) async {
    var response = await http.get(Uri.parse(baseUrl + "/meals/${meal.id}"));
    if (response.statusCode == 200) {
      Meal meal;
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      meal = Meal.fromJson(jsonResponse["meal_roulette_app_meals_by_pk"]);

      return meal;
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
