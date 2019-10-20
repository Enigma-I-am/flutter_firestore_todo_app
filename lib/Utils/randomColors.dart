import 'dart:math';

import 'package:flutter/material.dart';


Color randomColors() {
  List<Color> colors = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.deepOrange,
    Color.fromRGBO(34, 111, 255, 1),
  ];
  Random random = new Random();

  int index = 0;

  index = random.nextInt(colors.length);
  return colors[index];
}