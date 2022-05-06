import 'package:calculator/logic/calulator_cubit.dart';
import 'package:calculator/presentation/layout/layout_screen.dart';
import 'package:calculator/presentation/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Baijamjuree"),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: const SafeArea(child: MyHomePage()),
      ),
    );
  }
}
