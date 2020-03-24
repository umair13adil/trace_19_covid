import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static var gradients = [
    LinearGradient(
      colors: [
        Colors.white,
        Colors.blue,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    LinearGradient(
      colors: [
        Colors.white,
        Colors.orange,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    LinearGradient(
      colors: [
        Colors.white,
        Colors.red,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    LinearGradient(
      colors: [
        Colors.white,
        Colors.purple,
      ],
      stops: [
        0.3,
        0.7,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    )
  ];

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.green,
        width: 3.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}
