import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack9003f => BoxDecoration();
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get fillIndigo100 => BoxDecoration(
        color: ColorConstant.indigo100,
      );
  static BoxDecoration get outlineGreen900 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.green900,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtOutlineGreen900 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.green900,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40.00,
    ),
  );

  static BorderRadius circleBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17.00,
    ),
  );

  static BorderRadius txtRoundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );
}
