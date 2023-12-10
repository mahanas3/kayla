import 'package:flutter/material.dart';
import 'package:kayla/utilities/dimensions.dart';

class CustomUserTextField extends StatefulWidget {
  const CustomUserTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomUserTextField> createState() => _CustomUserTextFieldState();
}

class _CustomUserTextFieldState extends State<CustomUserTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.heightCalc(context, 10))),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusColor: Colors.grey,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: 'RobotoMedium'),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'RobotoMedium',
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        ),
      ),
    );
  }
}
