import 'controller/photo_me_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/user.dart';
import 'package:my_app/db/model/hymettuspathone.dart';
import 'package:my_app/db/model/hymettuspathtwo.dart';
import 'package:my_app/db/model/parnithapathone.dart';
import 'package:my_app/db/model/parnithapathtwo.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/db/Utility.dart';
import 'package:my_app/db/model/photo.dart';
import 'dart:io';

class Me_ScreenArguments {
  final int index;
  final int offset;
  final List<Photo> list;

  Me_ScreenArguments(this.index, this.offset, this.list);
}

class Photo_meScreen extends GetWidget<Photo_meController> {
  @override
  Widget build(BuildContext context) {
    final index =
        ModalRoute.of(context)!.settings.arguments as Me_ScreenArguments;
    log("index  = " + index.index.toString());
    log("length = " + index.list.length.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black900,
        body: GestureDetector(
          onDoubleTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                padding: getPadding(
                  top: 80,
                  bottom: 51,
                ),
                decoration: AppDecoration.fillBlack900,
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 500.0,
                      viewportFraction: 0.9,
                      initialPage: index.offset),
                  items: index.list.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                BoxDecoration(color: ColorConstant.green900),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Utility.imageFromBase64String(
                                    i.photo_name)));
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
