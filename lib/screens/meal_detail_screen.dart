import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_boilerplate_flutter/cubit/meal_cubit.dart';
import 'package:mobile_boilerplate_flutter/data/meal.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealDetail) {
          return _buildMealDetail(context, state.meal);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

Widget _buildMealDetail(BuildContext context, Meal meal) {
  return Container(
    height: double.maxFinite,
    width: double.maxFinite,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        TextButton(
          child: Text('Go back'),
          onPressed: () {
            BlocProvider.of<MealCubit>(context).goHome();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.network(meal.imageUrl)],
                    ),
                  ),
                  Text(meal.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(meal.description!),
                  const SizedBox(height: 10),
                  Text('Ingredients',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(meal.ingredients!)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
