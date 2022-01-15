import 'package:flutter/material.dart';
import 'package:mobile_boilerplate_flutter/screens/meal_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Roulette',
      home: MealSelectionScreen(),    
    );
  }
}