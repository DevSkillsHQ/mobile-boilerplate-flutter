import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_boilerplate_flutter/cubit/meal_cubit.dart';
import 'package:mobile_boilerplate_flutter/data/meal.dart';
import 'package:mobile_boilerplate_flutter/widgets/app_text.dart';
import 'package:mobile_boilerplate_flutter/widgets/image_container.dart';

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
  final mealId = meals.last.id > 10 ? 0 : meals.last.id;

  return Column(children: [
    Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ImageContainer(
                      imagePath: meals[index].imageUrl,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.22),
                  Expanded(
                    child: AppText(
                        text: meals[index].title, isBold: true, centered: true),
                  ),
                ],
              ),
            ),
            onTap: () {
              BlocProvider.of<MealCubit>(context)
                  .detailPage(meal: meals[index]);
            },
          );
        },
      ),
    ),
    Divider(),
    ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 100, height: 100),
      child: ElevatedButton(
        child: AppText(
          text: 'Refresh',
          fontSize: 16,
          isBold: true,
        ),
        onPressed: () {
          BlocProvider.of<MealCubit>(context)
              .getData(mealId: mealId);
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
        ),
      ),
    ),
  ]);
}
