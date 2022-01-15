import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_boilerplate_flutter/cubit/meal_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome'),
            TextButton(
                onPressed: () {
                  BlocProvider.of<MealCubit>(context).getData();
                },
                child: Text('Press')),
          ],
        ),
      ),
    );
  }
}
