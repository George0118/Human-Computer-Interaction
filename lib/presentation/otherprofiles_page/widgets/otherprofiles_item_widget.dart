import '../controller/otherprofiles_controller.dart';
import '../models/otherprofiles_item_model.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';

// ignore: must_be_immutable
class OtherprofilesItemWidget extends StatelessWidget {
  OtherprofilesItemWidget(this.index, this.otherprofilesItemModelObj,
      {this.onTapProfileUser});

  OtherprofilesItemModel otherprofilesItemModelObj;

  int index;

  var controller = Get.find<OtherprofilesController>();

  VoidCallback? onTapProfileUser;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onTapProfileUser;
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
                                "User" + Users[index],
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
                                PathPoints[index],
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
                            CommonPaths[index],
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
    );
  }
}

List<String> Users = ["2", "3"];

List<String> CommonPaths = [
  "You have 4 paths in common",
  "You have 3 paths in common"
];

List<String> PathPoints = ["Path Points: 75", "Path Points: 50"];
