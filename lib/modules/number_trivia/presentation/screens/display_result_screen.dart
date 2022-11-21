import 'package:flutter/material.dart';
import '../../../../core/theme/app_color_pallet.dart';
import '../../../../core/theme/app_text.dart';
import '../widgets/background.dart';

class DisplayResultScreen extends StatelessWidget {
  const DisplayResultScreen({
    Key? key,
    required this.raio,
    required this.height,
    required this.custo,
  }) : super(key: key);

  final double raio;
  final double height;
  final double custo;

  @override
  Widget build(BuildContext context) {
    return Background(
      children: [
        Positioned(
            top: 61,
            left: 48,
            right: 48,
            child: AppText.headline(data: "SiTech")),
        Positioned(
            top: 164,
            right: 0,
            left: 0,
            child: Image.asset(
              "lib/assets/silo-icon.png",
              height: 248,
            )),
        Positioned(
            top: 500,
            left: 48,
            right: 48,
            child: AppText.body(
                data:
                    "Result in meters\n Height: $height\nRadius: $raio\nBudget: $custo",
                textColor: AppColors.primaryColor)),
        Positioned(
          top: 600,
          left: 126,
          right: 126,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 138,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: AppText.body(data: "Order"),
            ),
          ),
        )
      ],
    );
  }
}
