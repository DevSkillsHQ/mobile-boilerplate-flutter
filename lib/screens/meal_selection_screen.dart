import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_boilerplate_flutter/cubit/meal_cubit.dart';
import 'package:mobile_boilerplate_flutter/data/meal.dart';

class MealSelectionScreen extends StatelessWidget {
  const MealSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) {
          if (state is MealLoaded) {
            return _buildMealSelection(context, state.meals);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget _buildMealSelection(BuildContext context, List<Meal> meals) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
    ),
    itemCount: 4,
    itemBuilder: (context, index) {
      return InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(meals[index].imageUrl)),
              Expanded(
                child: Text(meals[index].title, style: TextStyle(fontSize: 10))),
            ],
          ),
        ),
        onTap: () {
          BlocProvider.of<MealCubit>(context).detailPage(meal: meals[index]);
          Navigator.pop(context);
        },
      );
    },
  );
}
