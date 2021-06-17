import 'package:flutter/material.dart';

class Responsive {
  double width(double p, BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    if (_orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * (p / 100);
    } else {
      return MediaQuery.of(context).size.height * (p / 100);
    }
  }

  double height(double p, BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    if (_orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * (p / 100);
    } else {
      return MediaQuery.of(context).size.width * (p / 100);
    }
  }
}
