import 'controller/friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/user.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
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
    return isLoading
        ? Text("Loading...",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorConstant.black900))
        : SafeArea(
            child: Scaffold(
                backgroundColor: ColorConstant.whiteA700,
                appBar: CustomAppBar(
                    height: size.height * 0.2,
                    leadingWidth: size.height * 0.2,
                    leading: Card(
                        margin:
                            getMargin(top: 23, left: 23, right: 23, bottom: 15),
                        elevation: 0,
                        color: ColorConstant.whiteA700,
                        child: Container(
                            height: size.height * 0.10,
                            width: size.height * 0.10,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorConstant.green900,
                                width: 2,
                              ),
                            ),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgPhoto151880611,
                                height: size.height * 0.10,
                                width: size.height * 0.10,
                                radius: BorderRadius.circular(50),
                                alignment: Alignment.center))),
                    title: AppbarTitle(
                        text: curr_user.username,
                        margin: getMargin(left: 0, top: 35, bottom: 28))),
                body: Container(
                    width: size.width,
                    padding: getPadding(left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                onTapTxtCheckoutother();
                              },
                              child: Padding(
                                  padding: getPadding(left: 3),
                                  child: Text("msg_check_out_other".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold20Green900
                                          .copyWith(
                                              height: getVerticalSize(1.98))))),
                          Padding(
                              padding: getPadding(top: 30, bottom: 30),
                              child: Text("lbl_friends".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold32.copyWith(
                                      height: getVerticalSize(1.24)))),
                          Container(
      height: getVerticalSize(
        size.height * 0.1,
      ),
      width: getHorizontalSize(
        size.width,
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                onTapProfileFriend1();
              },
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
                  Padding(
                    padding: getPadding(
                      left: 7,
                      top: 0,
                      bottom: 3,
                    ),
                    child: Container(
                        width: size.width * 0.65,
                        child: Column(children: [
                          Row(children: [
                            Expanded(
                                child: FittedBox(
                                    child: Row(children: [
                              Text(
                                "Friend" + Friends[0],
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: AppStyle.txtInterSemiBold32.copyWith(
                                  height: getVerticalSize(
                                    1.24,
                                  ),
                                ),
                              ),
                              Padding(padding: getPadding(left: 10)),
                              Text(
                                PathPoints[0],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterSemiBold20Green900
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.98,
                                  ),
                                ),
                              )
                            ]))),
                          ]),
                          Expanded(
                              child: FittedBox(
                                  child: Text(
                            CommonPaths[0],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold20Green900.copyWith(
                              height: getVerticalSize(
                                1.98,
                              ),
                            ),
                          ))),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
                          Padding(padding: getMargin(top: 30)),
                          Container(
      height: getVerticalSize(
        size.height * 0.1,
      ),
      width: getHorizontalSize(
        size.width,
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                onTapProfileFriend2();
              },
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
                  Padding(
                    padding: getPadding(
                      left: 7,
                      top: 0,
                      bottom: 3,
                    ),
                    child: Container(
                        width: size.width * 0.65,
                        child: Column(children: [
                          Row(children: [
                            Expanded(
                                child: FittedBox(
                                    child: Row(children: [
                              Text(
                                "Friend" + Friends[1],
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: AppStyle.txtInterSemiBold32.copyWith(
                                  height: getVerticalSize(
                                    1.24,
                                  ),
                                ),
                              ),
                              Padding(padding: getPadding(left: 10)),
                              Text(
                                PathPoints[1],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterSemiBold20Green900
                                    .copyWith(
                                  height: getVerticalSize(
                                    1.98,
                                  ),
                                ),
                              )
                            ]))),
                          ]),
                          Expanded(
                              child: FittedBox(
                                  child: Text(
                            CommonPaths[1],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold20Green900.copyWith(
                              height: getVerticalSize(
                                1.98,
                              ),
                            ),
                          ))),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
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

  onTapTxtCheckoutother() {
    Get.toNamed(AppRoutes.otherprofilesContainerScreen);
  }

  onTapProfileFriend1() {
    Get.toNamed(AppRoutes.friendoneScreen);
  }

  onTapProfileFriend2() {
    Get.toNamed(AppRoutes.friendtwoScreen);
  }
}

List<String> Friends = ["1", "2"];

List<String> CommonPaths = [
  "You have 4 paths in common",
  "You have 3 paths in common"
];

List<String> PathPoints = ["Path Points: 75", "Path Points: 50"];
