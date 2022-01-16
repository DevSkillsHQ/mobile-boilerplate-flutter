import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_boilerplate_flutter/cubit/meal_cubit.dart';
import 'package:mobile_boilerplate_flutter/data/meal.dart';
import 'package:mobile_boilerplate_flutter/screens/meal_detail_screen.dart';
import 'package:mobile_boilerplate_flutter/screens/meal_selection_screen.dart';

import 'package:mobile_boilerplate_flutter/service/meal_service.dart';

void main() {
  group('MealCubit', () {
    MealService mealService = MealService();
    MealCubit mealCubit = MealCubit(data: mealService);

    test('should return initial state', () {
      expect(mealCubit.state, MealInitial());
    });
  });
}
