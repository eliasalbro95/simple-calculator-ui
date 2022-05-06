import '../../presentation/style/colors.dart';

final List<String> buttons = [
  "C",
  "DEL",
  "%",
  "/",
  "9",
  "8",
  "7",
  "x",
  "6",
  "5",
  "4",
  "-",
  "3",
  "2",
  "1",
  "+",
  "+/-",
  "0",
  ".",
  "="
];

enum Operators {
  function,
  equal,
  numbers,
  clear,
}

Map colors={1:functionButtonColor,2:cButtonForgroundColor,3:buttonColor};
