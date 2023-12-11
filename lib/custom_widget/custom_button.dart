import 'package:flutter/material.dart';
import 'package:kayla/utilities/dimensions.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);

  String text;
  final VoidCallback onPressed;

  Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: Dimensions.heightCalc(context, 18)),
      ),
    );
  }
}
