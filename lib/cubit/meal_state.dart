part of 'meal_cubit.dart';

@immutable
abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {
  @override
  List<Object> get props => [];
}

class MealLoading extends MealState {
  const MealLoading(this.meals);

  final List<Meal> meals;
  @override
  List<Object> get props => [meals];
}

class MealLoaded extends MealState {
  const MealLoaded(this.meals);

  final List<Meal> meals;

  @override
  List<Object> get props => [meals];
}

class MealDetail extends MealState {
  const MealDetail(this.meal);

  final Meal meal;

  @override
  List<Object> get props => [meal];
}
