import 'controller/photoone_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScreenArguments {
  final int index;
  final int offset;

  ScreenArguments(this.index, this.offset);
}

class PhotooneScreen extends GetWidget<PhotooneController> {

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black900,
        body: GestureDetector( 
        onDoubleTap:() {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              padding: getPadding(
                top: 160,
                bottom: 51,
              ),
              decoration: AppDecoration.fillBlack900,
              child: CarouselSlider(
            options: CarouselOptions(height: 370.0, viewportFraction: 0.9, initialPage: index.offset),
            items: Maps[index.index].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: ColorConstant.green900
                      ),
                      child: ImageList[index.index][i]
                    );
                  },
                );
              }).toList(),
             ),
            ),
          ),
        ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeDefaultScreen;
      case BottomBarEnum.Trip:
        return AppRoutes.tripsScreen;
      case BottomBarEnum.Me:
        return AppRoutes.meScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.otherprofilesPage:
        return OtherprofilesPage();
      default:
        return DefaultWidget();
    }
  }

}

List<List> ImageList = [Images1, Images2, Images3];

List<CustomImageView> Images1 = [
  CustomImageView(
      imagePath:
          ImageConstant.imgImage3202x165,
  ),
  CustomImageView(
      imagePath: ImageConstant.imgImage4,
  )
];

List<CustomImageView> Images2 = [
  CustomImageView(
      imagePath:
          ImageConstant.imgImage4202x165,
  ),
  CustomImageView(
      imagePath: ImageConstant.imgImage5,
  ),
  CustomImageView(
      imagePath: ImageConstant.imageDeerParnitha,
  )
];

List<CustomImageView> Images3 = [
  CustomImageView(
      imagePath:
          ImageConstant.imgImage4202x197,
  ),
  CustomImageView(
      imagePath: ImageConstant.imgImage5202x141,
  )
];

List<List> Maps = [[0,1], [0,1,2], [0,1]];

