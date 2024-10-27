import 'controller/parnitha_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:audioplayers/audioplayers.dart';

class ParnithaScreen extends StatefulWidget {
  @override
  _ParnithaScreenState createState() => _ParnithaScreenState();
}

class _ParnithaScreenState extends State<ParnithaScreen> {
  double _value = 5;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(110.00),
                title: Padding(
                    padding: getPadding(left: 25),
                    child: Row(children: [
                      AppbarImage(
                          height: getVerticalSize(100.00),
                          width: getHorizontalSize(screenWidth*0.25),
                          imagePath: ImageConstant.imgImage3,
                          onTap: onTapImageThree),
                      AppbarTitle(
                          text: "lbl_parnitha".tr,
                          margin: getMargin(top: 38, bottom: 32, left: 10),
                          onTap: onTapParnitha)
                    ]))),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        margin: getMargin(left: 30, top: 20, right: 16),
                        decoration: AppDecoration.fillWhiteA700,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 0),
                                  child: Text("msg_suggested_trails".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold32
                                          .copyWith(
                                              height: getVerticalSize(1.24)))),
                              Column(children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtLanguage();
                                    },
                                    child: Container(
                                        padding: getMargin(left: 0, top: 15),
                                        child: Text("msg_thrakomakedones".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold20
                                                .copyWith(
                                                    height: getVerticalSize(
                                                        1.98))))),
                                Container(
                                    padding: getMargin(left: 0),
                                    alignment: Alignment.bottomLeft,
                                    margin: getMargin(bottom: 3),
                                    child: Text(
                                      "lbl_4_4_km".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterRegular20
                                          .copyWith(
                                              height: getVerticalSize(1.98)),
                                    ))
                              ]),
                              Container(
                                  margin: getMargin(left: 0, top: 5),
                                  child: Column(children: [
                                    Container(
                                        child: GestureDetector(
                                            onTap: () {
                                              onTapTxtLanguageOne();
                                            },
                                            child: Container(
                                                width: 400,
                                                child: Text(
                                                    "Mpafi - Skipiza - Mola - Mpafi",
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterSemiBold20
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.98)))))),
                                    Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding:
                                                getPadding(left: 0),
                                            child: Text("lbl_8_6_km".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterRegular20
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.98))))),
                                  ])),
                              CustomImageView(
                                  imagePath: ImageConstant.imgImage1,
                                  height: getVerticalSize(screenHeight*0.2),
                                  width: getHorizontalSize(screenWidth*0.9),
                                  alignment: Alignment.center,
                                  margin: getMargin(top: 21)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding:
                                          getPadding(left: 0, top: 7, right: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                            width: screenWidth*0.35,
                                            child: Text("Description",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterSemiBold24
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.65)))),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgVolumeBlack900,
                                                height: getVerticalSize(40.00),
                                                width: getHorizontalSize(40.00),
                                                margin: getMargin(
                                                    top: 0,
                                                    bottom: 0,
                                                    right: 0),
                                                onTap: () {
                                                  AudioPlayer().play(AssetSource(
                                                      'audio/audio_parnitha.mp3'));
                                                }),
                                            Container(
                                              width: getHorizontalSize(screenWidth*0.4),
                                              decoration: new BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      new Radius.circular(5.0)),
                                                  boxShadow: [
                                                    new BoxShadow(
                                                        color: Color.fromARGB(
                                                            96, 82, 82, 82),
                                                        offset: new Offset(
                                                            0.0, 2.0),
                                                        blurRadius: 10)
                                                  ]),
                                              child: new Slider(
                                                value: _value,
                                                activeColor:
                                                    ColorConstant.green900,
                                                inactiveColor:
                                                    ColorConstant.green900,
                                                onChanged: (double s) {
                                                  setState(() {
                                                    _value = s;
                                                  });
                                                },
                                                divisions: 10,
                                                min: 4.0,
                                                max: 8.0,
                                              ),
                                            ),
                                          ]))),
                              Container(
                                  width: getHorizontalSize(389.00),
                                  margin: getMargin(top: 20, left: 0, right: 0),
                                  child: Text("msg_mt_parnitha_is_located".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 4 * _value)))
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

  onTapTxtLanguage() {
    Get.toNamed(AppRoutes.parnithaPathoneScreen);
  }

  onTapTxtLanguageOne() {
    Get.toNamed(AppRoutes.parnithaPathtwoScreen);
  }

  onTapImageThree() {
    Get.toNamed(AppRoutes.homeDefaultScreen);
  }

  onTapParnitha() {
    Get.toNamed(AppRoutes.parnithaScreen);
  }
}
