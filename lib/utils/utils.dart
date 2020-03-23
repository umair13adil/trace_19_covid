import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {

  static var gradients = [
    LinearGradient(
      colors: [
        Colors.orange,
        Colors.blue,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        Colors.red,
        Colors.orange,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        Colors.teal,
        Colors.red,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    )
  ];
}
