import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_boilerplate_flutter/service/meal_service.dart';

import 'cubit/meal_cubit.dart';
import 'cubit/meal_logic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Roulette',
      home: BlocProvider<MealCubit>(
        create: (context) => MealCubit(
          data: MealService(),
        ),
        child: const MealLogic(),
      ),    
    );
  }
}