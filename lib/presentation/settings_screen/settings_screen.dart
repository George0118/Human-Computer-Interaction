import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/widgets/custom_drop_down.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'dart:developer';
import 'dart:async';
import 'package:my_app/db/database.dart';
import "package:my_app/db/model/user.dart";

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late User curr_user;
  bool isLoading = false;
  SettingsController controller = SettingsController();

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

  void show_Simple_Snackbar(BuildContext context, String title, String message,
      int delay, bool dismissable) async {
    await Future.delayed(Duration(seconds: delay));
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: dismissable,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      title: title,
      message: message,
      backgroundColor: ColorConstant.green900,
    )..show(context);
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
                padding: getPadding(
                  left: 13,
                  top: 0,
                  right: 13,
                  bottom: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgSettings,
                            height: getSize(
                              30.00,
                            ),
                            width: getSize(
                              30.00,
                            ),
                            margin: getMargin(
                              top: 1,
                              bottom: 7,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 11,
                            ),
                            child: Text(
                              "lbl_settings".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold32.copyWith(
                                height: getVerticalSize(
                                  1.24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          top: 25,
                          right: 0,
                          left: 0,
                        ),
                        child: Row(children: [
                          Expanded(
                              child: FittedBox(
                                  child: Row(
                            children: [
                              Padding(
                                padding: getPadding(
                                  bottom: 3,
                                ),
                                child: Text(
                                  "msg_check_for_new_trails".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtInterSemiBold20.copyWith(
                                    height: getVerticalSize(
                                      1.98,
                                    ),
                                  ),
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgDownload,
                                height: getSize(
                                  35.00,
                                ),
                                width: getSize(
                                  35.00,
                                ),
                                margin: getMargin(
                                  left: 20,
                                  top: 1,
                                ),
                                onTap: (() async {
                                  ConnectivityResult connectivityResult =
                                      await (Connectivity()
                                          .checkConnectivity());
                                  log("I should know connectivity");
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    log("no internet");
                                    show_Simple_Snackbar(
                                        context,
                                        "No Internet Access.",
                                        "Try reconnecting to the internet",
                                        0,
                                        true);
                                  } else {
                                    log("yes internet");
                                    show_Simple_Snackbar(
                                        context,
                                        "Downloading...",
                                        "Please wait a moment.",
                                        0,
                                        false);
                                    show_Simple_Snackbar(
                                        context,
                                        "Download Completed!",
                                        "Check your profile for new available paths!",
                                        5,
                                        true);
                                  }
                                }),
                              ),
                            ],
                          )))
                        ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(top: 28, left: 2),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Expanded(
                                  child: FittedBox(
                                      child: Row(
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      bottom: 13,
                                    ),
                                    child: Text(
                                      "msg_select_language".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style:
                                          AppStyle.txtInterSemiBold20.copyWith(
                                        height: getVerticalSize(
                                          1.98,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomDropDown(
                                    width: size.width * 0.45,
                                    focusNode: FocusNode(),
                                    icon: Container(
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowdown,
                                      ),
                                    ),
                                    hintText: "msg_english_default".tr,
                                    items: controller.settingsModelObj.value
                                        .dropdownItemList,
                                    onChanged: (value) {
                                      controller.onSelected(value);
                                    },
                                  ),
                                ],
                              )))
                            ]),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 3,
                        top: 23,
                        bottom: 5,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Delete Account"),
                              content: Text(
                                  "Are you sure you want to delete your account?"),
                              actions: [
                                TextButton(
                                  child: Text("Yes"),
                                  onPressed: () {
                                    MyDatabase.instance
                                        .readCurr()
                                        .then((curr_user) {
                                      MyDatabase.instance.deleteUser(
                                          curr_user.username,
                                          curr_user.password);
                                      onTapLogin();
                                    });
                                  },
                                ),
                                TextButton(
                                  child: Text("No"),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          );
                        },
                        child: Text(
                          "lbl_delete_account".tr,
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
                  ],
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

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
