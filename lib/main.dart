import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'modules/number_trivia/presentation/screens/calc_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: const CalcScreen(),
  ));
}
