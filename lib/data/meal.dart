import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List ingredients;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      ingredients: json['ingredients'],
    );
  }
}