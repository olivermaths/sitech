import 'package:flutter/material.dart';

import 'app_color_pallet.dart';

abstract class AppTheme {
  static InputDecoration appInputDecoration({String hintText = ""}) => InputDecoration(
      errorText: null,
      errorStyle: const TextStyle(
        fontSize: 0,
      ),
      filled: true,
      hintText: hintText,
      fillColor: AppColors.defaultWhite,
      contentPadding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      errorBorder: defaultErrorInputBorder,
      focusedErrorBorder: defaultInputBorder,
      focusedBorder: defaultInputBorder,
      enabledBorder: defaultInputBorder,
      border: defaultInputBorder);

  static ThemeData appTheme = ThemeData(
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: null,
        errorStyle: null,
        filled: true,
        fillColor: AppColors.defaultWhite,
        errorBorder: defaultErrorInputBorder,
        focusedErrorBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder,
        enabledBorder: defaultInputBorder,
        border: defaultInputBorder),
  );

  static OutlineInputBorder defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9), borderSide: BorderSide(width: 2, color: AppColors.primaryColor));

  static OutlineInputBorder defaultErrorInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(width: 2, color: Colors.red));
}
