import 'package:calculator/presentation/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key, this.textColor, this.label, this.backgroundColor, required this.buttonTapped})
      : super(key: key);
  final textColor;
  final label;
  final backgroundColor;
  final Function() buttonTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: backgroundColor,
            child: Center(
              child: Text(label, style: TextStyle(color: textColor,fontSize: 20.0,)),
            ),
          ),
        ),
      ),
    );
  }
}

Widget defaultButton({
  required String label,
  required VoidCallback? onPressed,
  double width = 50.0,
  double height = 50.0,
  Color backgroundColor = const Color(0x27151518),
  Color fontColor = Colors.white,
  double fontSize = 18.0,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, color: fontColor),
      ),
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
    );
