import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile_boilerplate_flutter/data/meal.dart';

class MealService {
  String baseUrl = "https://playground.devskills.co/api/rest/meal-roulette-app";

  Future<List<Meal>> getMeals() async {
    var response = await http.get(Uri.parse(baseUrl + "/meals"));
    if (response.statusCode == 200) {
      Map<String, dynamic> list = json.decode(response.body);
      List<Meal> meals = [];

      for (var meal in list["meal_roulette_app_meals"]) {
        meals.add(Meal.fromJson(meal));
      }

      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Meal> getMeal(int id) async {
    var response = await http.get(Uri.parse(baseUrl + "/meals/$id"));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Meal.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
