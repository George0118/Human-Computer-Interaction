import 'controller/home_default_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/widgets/custom_icon_button.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/user.dart';

class HomeDefaultScreen extends StatefulWidget {
  @override
  _HomeDefaultScreenState createState() => _HomeDefaultScreenState();
}

class _HomeDefaultScreenState extends State<HomeDefaultScreen> {
  late User curr_user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getUser();
  }

  Future getUser() async {
    setState(() => isLoading = true);

    this.curr_user = await MyDatabase.instance.readCurr();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? Text("Loading...",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorConstant.black900))
        : SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                appBar: CustomAppBar(
                    height: getVerticalSize(150.00),
                    title: Row(children: [
                      AppbarImage(
                          height: getVerticalSize(100.00),
                          width: getHorizontalSize(screenWidth*0.25),
                          imagePath: ImageConstant.imgImage3,
                          margin: getMargin(left: 9)),
                      AppbarTitle(
                          text: "lbl_happy_trails".tr,
                          margin: getMargin(top: 32, bottom: 28))
                    ]),
                    actions: [
                      CustomIconButton(
                          height: 60,
                          width: 60,
                          flag: false,
                          onTap: () {
                            onTapBtnSettings();
                          },
                          child: CustomImageView(
                              svgPath: ImageConstant.imgSettings),
                          margin: getMargin(right: 25))
                    ]),
                body: Container(
                    padding: getPadding(left: 19, top: 8, right: 19, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 2),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: ColorConstant.green900,
                                                width: getHorizontalSize(2.00)),
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder40),
                                        child: Container(
                                            height: getSize(80.00),
                                            width: getSize(80.00),
                                            padding: getPadding(all: 2),
                                            decoration: AppDecoration
                                                .outlineGreen900
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder40),
                                            child: Stack(children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPhoto151880611,
                                                  height: getSize(76.00),
                                                  width: getSize(76.00),
                                                  radius: BorderRadius.circular(
                                                      getHorizontalSize(38.00)),
                                                  alignment: Alignment.center)
                                            ]))),
                                    Padding(
                                        padding: getPadding(
                                            left: 16, top: 11, bottom: 1),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Hi " + curr_user.username,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtInterSemiBold32
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.24))),
                                              Padding(
                                                  padding: getPadding(top: 4),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgLocation,
                                                        height: getSize(24.00),
                                                        width: getSize(24.00),
                                                        onTap: () {
                                                          onTapImgLocation();
                                                        }),
                                                    GestureDetector(
                                                        onTap: () {
                                                          onTapTxtYourLocationNowOne();
                                                        },
                                                        child: Padding(
                                                            padding: getPadding(
                                                                left: 3,
                                                                top: 2,
                                                                bottom: 1),
                                                            child: Text(
                                                                "msg_your_location_now"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtInterRegular16
                                                                    .copyWith(
                                                                        height:
                                                                            getVerticalSize(1.24)))))
                                                  ]))
                                            ])),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgVolume,
                                        height: getSize(40.00),
                                        width: getSize(40.00),
                                        margin: getMargin(
                                            left: 60, top: 11, bottom: 29),
                                        onTap: () {
                                          MyDatabase.instance
                                              .readUser(curr_user.username,
                                                  curr_user.password)
                                              .then((curr_user) {
                                            curr_user = User(
                                                id: curr_user.id,
                                                username: curr_user.username,
                                                password: curr_user.password,
                                                email: curr_user.email,
                                                curr: false,
                                                fp: curr_user.fp);
                                            MyDatabase.instance
                                                .setCurrUser(curr_user)
                                                .then((value) {
                                              onTapLogoutIcon();
                                            }, onError: (e) {});
                                          }, onError: (e) {});
                                        })
                                  ])),
                          Container(
                              margin: getMargin(left: 0, top: 30, right: 0),
                              decoration: AppDecoration.outlineBlack9003f,
                              child: Wrap(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 250,
                                        child: TextButton(
                                          onPressed: () {
                                            onTapBtnSearch();
                                          },
                                          child: Text(
                                            'Discover mountains and paths around you!',
                                            style: TextStyle(
                                                color: ColorConstant.green900,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    CustomIconButton(
                                        height: 60,
                                        width: 60,
                                        onTap: () {
                                          onTapBtnSearch();
                                        },
                                        child: CustomImageView(
                                            height: 60,
                                            width: 60,
                                            svgPath: ImageConstant.imgSearch),
                                        margin: getMargin(
                                            right: 0, bottom: 4, left: 0))
                                  ])),
                          Padding(
                              padding: getPadding(top: 45),
                              child: Text("msg_suggested_mountain".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterExtraBold24.copyWith(
                                      height: getVerticalSize(1.65)))),
                          Padding(
                              padding: getPadding(left: 2, top: 30, right: 81),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtImitos();
                                        },
                                        child: Padding(
                                            padding:
                                                getPadding(top: 2, left: 10),
                                            child: Text("lbl_hymettus".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterExtraBold20
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.98))))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtParnitha();
                                        },
                                        child: Padding(
                                            padding:
                                                getPadding(bottom: 0, right: 5),
                                            child: Text("lbl_parnitha".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterExtraBold20
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.98)))))
                                  ])),
                          Padding(
                              padding: getPadding(
                                  left: 2, top: 22, right: 4, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant
                                            .imgPhoto151880611150x162,
                                        height: getVerticalSize(150.00),
                                        width: getHorizontalSize(162.00),
                                        radius: BorderRadius.circular(20.0),
                                        onTap: () {
                                          onTapTxtImitos();
                                        }),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgPhoto1518806111,
                                        height: getVerticalSize(150.00),
                                        width: getHorizontalSize(162.00),
                                        radius: BorderRadius.circular(20.0),
                                        onTap: () {
                                          onTapTxtParnitha();
                                        })
                                  ]))
                        ])),
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

  onTapImgLocation() {
    Get.toNamed(AppRoutes.mapScreen);
  }

  onTapLogoutIcon() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapTxtYourLocationNowOne() {
    Get.toNamed(AppRoutes.mapScreen);
  }

  onTapBtnSearch() {
    Get.toNamed(AppRoutes.mapScreen);
  }

  onTapBtnSettings() {
    Get.toNamed(AppRoutes.settingsScreen);
  }

  onTapTxtImitos() {
    Get.toNamed(AppRoutes.imitosScreen);
  }

  onTapTxtParnitha() {
    Get.toNamed(AppRoutes.parnithaScreen);
  }
}
