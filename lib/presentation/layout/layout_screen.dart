import 'package:calculator/presentation/style/colors.dart';
import 'package:calculator/shared/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/calulator_cubit.dart';
import '../../shared/components/components.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorCubit calcCubit = CalculatorCubit.get(context);
    return BlocConsumer<CalculatorCubit, CalculatorState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            calcCubit.userQuestion,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            calcCubit.result,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 38.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: buttons.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Buttons(
                            textColor: index == 0
                                ? cButtonForgroundColor
                                : Colors.white,
                            backgroundColor: calcCubit.colorizeTheButtons(
                                context, buttons[index]),
                            label: buttons[index],
                            buttonTapped:(){
                              calcCubit.buttonClicked(buttons[index]);
                            },
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
