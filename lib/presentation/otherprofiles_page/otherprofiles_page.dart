import '../otherprofiles_page/widgets/otherprofiles_item_widget.dart';
import 'controller/otherprofiles_controller.dart';
import 'models/otherprofiles_item_model.dart';
import 'models/otherprofiles_model.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_icon_button.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/user.dart';

class OtherprofilesPage extends StatefulWidget {
  OtherprofilesController controller =
      Get.put(OtherprofilesController(OtherprofilesModel().obs));

  @override
  _OtherprofilesPageState createState() => _OtherprofilesPageState();
}

class _OtherprofilesPageState extends State<OtherprofilesPage> {
  OtherprofilesController controller =
      Get.put(OtherprofilesController(OtherprofilesModel().obs));

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
                body: SingleChildScrollView(
                    child: Container(
                        width: size.width,
                        padding:
                            getPadding(left: 18, top: 0, right: 18, bottom: 26),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtFriends();
                                  },
                                  child: Padding(
                                      padding: getPadding(left: 10),
                                      child: Text("lbl_friends".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtInterSemiBold20Green900
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.98))))),
                              Container(
                                  width: size.width * 0.8,
                                  child: Padding(
                                      padding: getPadding(left: 5, top: 35),
                                      child: Expanded(
                                          child: FittedBox(
                                              child: Text(
                                                  "msg_discover_other_profiles"
                                                      .tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtInterSemiBold32
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.24))))))),
                              Container(
                                  margin:
                                      getMargin(left: 12, top: 17, right: 16),
                                  decoration: AppDecoration.outlineBlack9003f,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextFormField(
                                            width: size.width * 0.6,
                                            focusNode: FocusNode(),
                                            controller: controller
                                                .buttonExploreController,
                                            hintText: "msg_explore_profiles".tr,
                                            textInputAction:
                                                TextInputAction.done,
                                            prefix: Container(
                                                margin: getMargin(
                                                    left: 18,
                                                    top: 18,
                                                    right: 7,
                                                    bottom: 18),
                                                child: Icon(
                                                  IconData(0xf522,
                                                      fontFamily:
                                                          'MaterialIcons'),
                                                  color: ColorConstant.green900,
                                                )),
                                            prefixConstraints: BoxConstraints(
                                                maxHeight:
                                                    getVerticalSize(60.00))),
                                        CustomIconButton(
                                            height: 60,
                                            width: 60,
                                            margin: getMargin(left: 22),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgSearch))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 0, top: 39),
                                  child: Obx(() => ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(30));
                                      },
                                      itemCount: controller
                                          .otherprofilesModelObj
                                          .value
                                          .otherprofilesItemList
                                          .length,
                                      itemBuilder: (context, index) {
                                        OtherprofilesItemModel model =
                                            controller
                                                .otherprofilesModelObj
                                                .value
                                                .otherprofilesItemList[index];
                                        if (index == 0) {
                                          return OtherprofilesItemWidget(
                                              index, model,
                                              onTapProfileUser:
                                                  onTapProfileUser2);
                                        } else if (index == 1) {
                                          return OtherprofilesItemWidget(
                                              index, model,
                                              onTapProfileUser:
                                                  onTapProfileUser3);
                                        } else {
                                          return OtherprofilesItemWidget(
                                              index, model,
                                              onTapProfileUser:
                                                  onTapProfileUser2);
                                        }
                                      })))
                            ])))));
  }

  onTapProfileUser2() {
    Get.toNamed(AppRoutes.usertwoScreen);
  }

  onTapProfileUser3() {
    Get.toNamed(AppRoutes.userthreeScreen);
  }

  onTapTxtFriends() {
    Get.toNamed(AppRoutes.friendsScreen);
  }
}
