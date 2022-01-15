import 'package:flutter/material.dart';

class MealSelectionScreen extends StatelessWidget {
  const MealSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Selection'),
      ),
      body: const Center(
        child: Text('Meal Selection Screen'),
      ),
    );
  }
}
