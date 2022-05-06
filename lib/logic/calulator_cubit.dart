import 'package:calculator/shared/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import '../presentation/style/colors.dart';

part 'calulator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());

  static CalculatorCubit get(context) => BlocProvider.of(context);
  List functions = ["+", "-", "x", "/"];
  String userQuestion = '';
  String result = '';
  int? isLastCharIsFunction;
  String? lastChar;
  var buttonIs;

// Colorize the text

  void isOperatorText(String x) {
    if (x == '/' || x == '+' || x == '-' || x == 'x' || x == '%') {
      buttonIs = Operators.function;
    } else {
      buttonIs = Operators.numbers;
    }
  }

  Color colorizeText(BuildContext context, var x) {
    isOperator(x);
    if (buttonIs == Operators.function) {
      return functionButtonColor;
    } else {
      return buttonColor;
    }
  }

// Colorize the buttons

  void isOperator(String x) {
    if (x == '/' || x == '+' || x == '-' || x == 'x' || x == '%') {
      buttonIs = Operators.function;
    } else if (x == '=') {
      buttonIs = Operators.equal;
    } else if (x == "C") {
      buttonIs = Operators.clear;
    } else {
      buttonIs = Operators.numbers;
    }
  }

  Color colorizeTheButtons(BuildContext context, var x) {
    isOperator(x);
    if (buttonIs == Operators.function) {
      return functionButtonColor;
    } else if (buttonIs == Operators.equal) {
      return equalButtonColor;
    } else if (buttonIs == Operators.clear) {
      return cButtonBackgroundColor;
    } else {
      return buttonColor;
    }
  }

  void buttonClicked(String x) {
    if (x == "C") {
      try {
        userQuestion = "";
        result = "";
      } on RangeError {
        return;
      }
    } else if (x == "DEL") {
      try {
        result = result.substring(0, result.length - 1);
      } on RangeError {
        result = "0";
        return;
      }
    } else if (x == "=") {
      equalPressed();
    } else if ((x == '/' || x == '+' || x == '-' || x == 'x') &&
        (result[result.length - 1] == "x" ||
            result[result.length - 1] == "-" ||
            result[result.length - 1] == "+" ||
            result[result.length - 1] == "/")) {
      result = result.substring(0, result.length - 1);
      result += x;
    } else if (x == "+/-") {
      String temp = result;
      result = "-" + temp;
    } else {
      result += x;
    }

    emit(CalculatorButtonClicked());
  }

  void equalPressed() {
    String finalQuestion = result;
    finalQuestion = finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval;
    eval = exp.evaluate(EvaluationType.REAL, cm);
    userQuestion = result;
    if (eval / 2 == 0) {
      eval = eval.toInt() as double;
    }
    result = eval.toString();
  }
}
// if (x == "x" || x == "-" || x == "x" || x == "/") {
// result = result.substring(0, result.length - 1);
// result += x;
