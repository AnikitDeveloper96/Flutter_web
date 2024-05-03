import 'package:flutter/material.dart';
import 'package:sample_portfolio_app/src/presentation/constants/colors.dart';

import 'textStyles.dart';

class AppWidgets {
  ///
  buttonWidget(
    Color dynamicColor,
    String customText,
    Color textColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: dynamicColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(36.0, 13.0, 36.0, 13.0),
        child: Text(
          customText,
          textAlign: TextAlign.center,
          style: commonTextStyles(textColor, 20, FontWeight.w600),
        ),
      ),
    );
  }
}

downloadCvWidget() {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.nameColor)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(36.0, 13.0, 36.0, 13.0),
      child: Text(
        "Download CV",
        textAlign: TextAlign.center,
        style: commonTextStyles(AppColors.nameColor, 20, FontWeight.w600),
      ),
    ),
  );
}
