import 'controller/usertwo_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/presentation/photoone_screen/photoone_screen.dart';

class UsertwoScreen extends GetWidget<UsertwoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(150.00),
                leadingWidth: getHorizontalSize(80.00),
                leading: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: getMargin(left: 15, right: 0, top: 40, bottom: 30),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: ColorConstant.green900,
                            width: getHorizontalSize(2.00)),
                        borderRadius: BorderRadiusStyle.circleBorder40),
                    child: Container(
                        height: getSize(140.00),
                        width: getSize(140.00),
                        padding: getPadding(all: 2),
                        decoration: AppDecoration.outlineGreen900.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder40),
                        child: Stack(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgPhoto151880611,
                              height: getSize(76.00),
                              width: getSize(76.00),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(38.00)),
                              alignment: Alignment.center)
                        ]))),
                title: AppbarTitle(
                    text: "User2",
                    margin: getMargin(left: 20, top: 32, bottom: 28)),
                actions: [
                  AppbarSubtitle(
                      text: "Back",
                      margin:
                          getMargin(left: 20, top: 50, bottom: 0, right: 40),
                      onTap: onTapOtherUsers)
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 15, top: 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Path Points: 75",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold20Green900
                                      .copyWith(
                                          height: getVerticalSize(1.98))),
                              Padding(
                                padding: getPadding(
                                  left: 0,
                                  top: 15,
                                  bottom: 15,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Add Friend"),
                                        content: Text(
                                            "Are you sure you want to add this user to your friends?"),
                                        actions: [
                                          TextButton(
                                            child: Text("Yes"),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          TextButton(
                                            child: Text("No"),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Add Friend",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterSemiBold20.copyWith(
                                      height: getVerticalSize(
                                        1.98,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: getPadding(top: 13),
                                  child: Text("lbl_their_photos".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold32
                                          .copyWith(
                                              height: getVerticalSize(1.24)))),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtThrakomakedonesOne();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(342.00),
                                      margin: getMargin(top: 26),
                                      child: Text("msg_thrakomakedones4".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterRegular20
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.98))))),
                              Padding(
                                  padding: getPadding(top: 15, right: 30),
                                  child: SizedBox(
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            CustomImageView(
                                              margin: getMargin(right: 30),
                                              imagePath: ImageConstant
                                                  .imgImage3202x165,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(165.00),
                                              onTap: () {
                                                onTapImgImage(0, 0);
                                              },
                                            ),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgImage4,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(250.00),
                                              onTap: () {
                                                onTapImgImage(0, 1);
                                              },
                                            )
                                          ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtMpafiSkipiza();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 57),
                                      child: Text("msg_mpafi_skipiza3".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterRegular20
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.98))))),
                              Padding(
                                  padding: getPadding(top: 43, right: 11),
                                  child: SizedBox(
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            CustomImageView(
                                              margin: getMargin(right: 30),
                                              imagePath: ImageConstant
                                                  .imgImage4202x165,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(250.00),
                                              onTap: () {
                                                onTapImgImage(1, 0);
                                              },
                                            ),
                                            CustomImageView(
                                              margin: getMargin(right: 30),
                                              imagePath:
                                                  ImageConstant.imgImage5,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(250.00),
                                              onTap: () {
                                                onTapImgImage(1, 1);
                                              },
                                            ),
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imageDeerParnitha,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(250.00),
                                              onTap: () {
                                                onTapImgImage(1, 2);
                                              },
                                            )
                                          ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtLanguage();
                                  },
                                  child: Container(
                                      width: getHorizontalSize(342.00),
                                      margin: getMargin(top: 51),
                                      child: Text("msg_kesariani_monastery".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterRegular20
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.98))))),
                              Padding(
                                  padding: getPadding(top: 33),
                                  child: SizedBox(
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            CustomImageView(
                                              margin: getMargin(
                                                  right: 30, bottom: 30),
                                              imagePath: ImageConstant
                                                  .imgImage4202x197,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(250.00),
                                              onTap: () {
                                                onTapImgImage(2, 0);
                                              },
                                            ),
                                            CustomImageView(
                                              margin: getMargin(bottom: 30),
                                              imagePath: ImageConstant
                                                  .imgImage5202x141,
                                              height: getVerticalSize(202.00),
                                              width: getHorizontalSize(250.00),
                                              onTap: () {
                                                onTapImgImage(2, 1);
                                              },
                                            )
                                          ])))
                            ])))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type));
            })));
  }

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

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.otherprofilesPage:
        return OtherprofilesPage();
      default:
        return DefaultWidget();
    }
  }

  onTapTxtThrakomakedonesOne() {
    Get.toNamed(AppRoutes.parnithaPathoneScreen);
  }

  onTapImgImage(int index, int offset) {
    Get.toNamed(
      AppRoutes.photooneScreen,
      arguments: ScreenArguments(index, offset),
    );
  }

  onTapTxtMpafiSkipiza() {
    Get.toNamed(AppRoutes.parnithaPathtwoScreen);
  }

  onTapTxtLanguage() {
    Get.toNamed(AppRoutes.imittosPathtwoScreen);
  }

  onTapOtherUsers() {
    Get.toNamed(AppRoutes.otherprofilesContainerScreen);
  }
}
