import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_boilerplate_flutter/cubit/meal_cubit.dart';
import 'package:mobile_boilerplate_flutter/data/meal.dart';
import 'package:mobile_boilerplate_flutter/widgets/app_text.dart';
import 'package:mobile_boilerplate_flutter/widgets/image_container.dart';

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
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 30.0,
          ),
          child: TextButton.icon(
            label: AppText(
              text: 'Go back',
              fontSize: 18,
              isBold: true,
            ),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<MealCubit>(context).goHome();
            },
          ),
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
                      children: [
                        ImageContainer(
                          imagePath: meal.imageUrl,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.8,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(),
                  AppText(text: meal.title, fontSize: 16, isBold: true),
                  const SizedBox(height: 10),
                  AppText(text: meal.description!),
                  const SizedBox(height: 10),
                  AppText(text: 'Ingredients', fontSize: 16, isBold: true),
                  const SizedBox(height: 10),
                  AppText(text: meal.ingredients!)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
