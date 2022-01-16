import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_boilerplate_flutter/screens/meal_detail_screen.dart';
import 'package:mobile_boilerplate_flutter/screens/meal_selection_screen.dart';
import 'package:mobile_boilerplate_flutter/screens/welcome_screen.dart';

import 'meal_cubit.dart';

class MealLogic extends StatefulWidget {
  const MealLogic({Key? key}) : super(key: key);

  @override
  _MealLogicState createState() => _MealLogicState();
}

class _MealLogicState extends State<MealLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealInitial) {
          return const WelcomeScreen();
        }
        if (state is MealLoading) {
          return MealSelectionScreen();
        }
        if (state is MealLoaded) {
          return MealSelectionScreen();
        }
        if (state is MealDetail) {
          return MealDetailScreen();
        }

        return const Center(
          child: Text('Unknown state'),
        );
      },
    ));
  }
}
