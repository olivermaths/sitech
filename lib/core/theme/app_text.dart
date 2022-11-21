import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_pallet.dart';

abstract class AppText {
  static Text headline({String data = "default", double fontsize = 64}) => Text(
        data,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(color: AppColors.primaryColor, fontSize: fontsize, fontWeight: FontWeight.w900),
      );

  static Text body({
    String data = "default",
    double fontsize = 16,
    Color textColor = AppColors.defaultWhite,
  }) =>
      Text(
        data,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(color: textColor, fontSize: fontsize, fontWeight: FontWeight.w900),
      );
}
