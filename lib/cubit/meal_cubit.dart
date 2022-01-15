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
  late final meals;

  void getData() async {
    emit(MealLoading());
    try {
      meals = await data.getMeals();
      emit(MealLoaded(meals));
    } catch (e) {
      print(e);
    }
  }

  detailPage({required Meal meal}) {
    emit(MealDetail(meal));
  }

  goHome() {
    emit(MealLoaded(meals));
  }
}
