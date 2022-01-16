class Meal {
  final int id;
  final String title;
  final String imageUrl;
  final String? description;
  final String? ingredients;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      title: json['title'],
      imageUrl: json['picture'],
      description: json['description'],
      ingredients: json['ingredients'],
    );
  }
}
