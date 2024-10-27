import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage(
      {required this.height,
      required this.width,
      this.imagePath,
      this.svgPath,
      this.margin,
      this.decoration,
      this.radius,
      this.alignment,
      this.onTap});

  double height;

  double width;

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Decoration? decoration;

  BorderRadius? radius;

  Alignment? alignment;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        padding: margin ?? EdgeInsets.zero,
        decoration: decoration,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          radius: radius,
          alignment: alignment,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
