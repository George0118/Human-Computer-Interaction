import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';

// ignore: must_be_immutable
class AppbarStack extends StatelessWidget {
  AppbarStack({this.margin, this.shape, this.child, this.onTap});

  EdgeInsetsGeometry? margin;

  ShapeBorder? shape;

  Widget? child;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstant.green900,
              width: getHorizontalSize(
                2.00,
              ),
            ),
            borderRadius: BorderRadiusStyle.circleBorder40,
          ),
          child: Container(
            height: getSize(
              80.00,
            ),
            width: getSize(
              80.00,
            ),
            padding: getPadding(
              all: 2,
            ),
            decoration: AppDecoration.outlineGreen900.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder40,
            ),
            child: Stack(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgPhoto151880611,
                  height: getSize(
                    76.00,
                  ),
                  width: getSize(
                    76.00,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      38.00,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
