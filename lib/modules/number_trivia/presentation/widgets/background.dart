import 'package:flutter/material.dart';

import '../../../../core/theme/app_color_pallet.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: Stack(
          children: children,
        )));
  }
}
