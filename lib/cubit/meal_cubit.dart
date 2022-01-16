import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_boilerplate_flutter/data/meal.dart';
import 'package:mobile_boilerplate_flutter/service/meal_service.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit({required this.data}) : super(MealInitial()) {
    emit(MealInitial());
  }

  final MealService data;
  late List<Meal> meals;
  late final Meal meal;

  void getData({int? mealId}) async {
    emit(MealLoading([]));
    try {
      meals = await data.getMeals(mealId: mealId);

      emit(MealLoaded(meals));
    } catch (e) {
      print(e);
    }
  }

  detailPage({required Meal meal}) async {
    try {
      meal = await data.getMeal(meal);
      emit(MealDetail(meal));
    } catch (e) {
      print(e);
    }
  }

  goHome() {
    emit(MealLoaded(meals));
  }
}
