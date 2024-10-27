import 'package:my_app/presentation/trips_screen/models/dragable_list.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/presentation/trips_screen/trips_screen.dart';

List<DraggableList> allLists = [
  DraggableList(
    header: Row(children: [
      Container(
        padding: EdgeInsets.all(8),
        child: Text(
          "Current Trips",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: ColorConstant.black900),
        ),
      ),
      CustomImageView(
        margin: getMargin(left: 30),
        svgPath: ImageConstant.imgCamera,
        onTap: (() async {
          onTapImgCamera();
        }),
      )
    ]),
    items: [
      DraggableListItem(
        txt: Container(
            alignment: Alignment.centerLeft,
            margin: getMargin(left: 0, right: 50),
            width: 400,
            child: TextButton(
                onPressed: () => onTapTxtThrakomakedonesOne(),
                child: Text(
                  "msg_thrakomakedones2".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorConstant.green900),
                ))),
      ),
    ],
  ),
  DraggableList(
    header: Container(
      padding: EdgeInsets.all(8),
      child: Text(
        "Future Trips",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ColorConstant.black900),
      ),
    ),
    items: [
      DraggableListItem(
          txt: Container(
              alignment: Alignment.centerLeft,
              margin: getMargin(left: 0, right: 50),
              width: 400,
              child: TextButton(
                  onPressed: () => onTapTxtLanguage(),
                  child: Text(
                    "msg_kesariani_fire_lookout2".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstant.green900),
                  )))),
    ],
  ),
  DraggableList(
    header: Container(
      padding: EdgeInsets.all(8),
      child: Text(
        "Past Trips",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ColorConstant.black900),
      ),
    ),
    items: [
      DraggableListItem(
          txt: Container(
              alignment: Alignment.centerLeft,
              margin: getMargin(left: 0, right: 50),
              width: 400,
              child: TextButton(
                  onPressed: () => onTapTxtLanguageOne(),
                  child: Text(
                    "msg_kesariani_monastery2".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstant.green900),
                  )))),
      DraggableListItem(
          txt: Container(
              alignment: Alignment.centerLeft,
              margin: getMargin(left: 0, right: 50),
              width: 400,
              child: TextButton(
                  onPressed: () => onTapTxtMpafiSkipiza(),
                  child: Text(
                    "msg_mpafi_skipiza2".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstant.green900),
                  )))),
    ],
  ),
];

onTapTxtThrakomakedonesOne() {
  Get.toNamed(AppRoutes.parnithaPathoneScreen);
}

onTapTxtLanguage() {
  Get.toNamed(AppRoutes.imittosPathoneScreen);
}

onTapTxtLanguageOne() {
  Get.toNamed(AppRoutes.imittosPathtwoScreen);
}

onTapTxtMpafiSkipiza() {
  Get.toNamed(AppRoutes.parnithaPathtwoScreen);
}

onTapImgCamera() async {
  await PermissionManager.askForPermission(Permission.camera);
  await PermissionManager.askForPermission(Permission.storage);
  List<String?>? imageList = [];
  await FileManager().showModelSheetForImage(getImages: (value) async {
    imageList = value;
  });
}


