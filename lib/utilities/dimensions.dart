import 'dart:core';

import 'package:flutter/cupertino.dart';

class Dimensions {
  static double heightCalc(BuildContext context, double value) {
    var height = MediaQuery.of(context).size.height;
    var result = height / value;
    var output = height / result;
    return output;
  }

  static double widthCalc(BuildContext context, double value) {
    var width = MediaQuery.of(context).size.width;
    var result = width / value;
    var output = width / result;
    return output;
  }
}
