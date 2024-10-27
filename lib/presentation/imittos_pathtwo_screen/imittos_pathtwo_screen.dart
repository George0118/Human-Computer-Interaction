import 'controller/imittos_pathtwo_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/presentation/google_maps.dart/google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/hymettuspathtwo.dart';
import 'package:my_app/db/model/user.dart';
import 'package:my_app/db/model/rating.dart';

class ImittosPathtwoScreen extends StatefulWidget {
  @override
  _ImittosPathtwoScreenState createState() => _ImittosPathtwoScreenState();
}

class _ImittosPathtwoScreenState extends State<ImittosPathtwoScreen> {
  late User curr_user;
  bool isLoading = false;
  late double rating;
  double _value = 5;

  @override
  void initState() {
    super.initState();

    getUser();
  }

  Future<double> getRating() async {
    double rating = 0;
    await MyDatabase.instance.readRatingforPath("HP2").then((value) {
      for (int i = 0; i < value.length; i++) {
        rating = rating + value[i].rate;
      }
      if (value.length != 0.0) {
        rating = rating / value.length;
      }
    });
    return rating;
  }

  Future getUser() async {
    setState(() => isLoading = true);

    this.curr_user = await MyDatabase.instance.readCurr();
    this.rating = await getRating();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                    height: getVerticalSize(110.00),
                    title: Padding(
                        padding: getPadding(left: 24),
                        child: Row(children: [
                          AppbarImage(
                              height: getVerticalSize(100.00),
                              width: getHorizontalSize(screenWidth * 0.25),
                              imagePath: ImageConstant.imgImage3,
                              onTap: onTapHome),
                          AppbarTitle(
                              text: "lbl_hymettus".tr,
                              margin: getMargin(top: 25, bottom: 25),
                              onTap: onTapHymettus)
                        ]))),
                body: SizedBox(
                    width: size.width,
                    child: SingleChildScrollView(
                        child: Container(
                            width: size.width,
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: getMargin(left: 10, top: 10),
                                      child: Text("msg_kesariani_monastery3".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold24
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.65)))),
                                  Padding(
                                      padding: getPadding(
                                        left: 8,
                                        top: 20,
                                        bottom: 10,
                                      ),
                                      child: Row(children: [
                                        Text("Rating: " + rating.toString(),
                                            style: TextStyle(
                                                color: ColorConstant.green900,
                                                fontSize: 20)),
                                        Icon(
                                            IconData(0xe5f9,
                                                fontFamily: 'MaterialIcons'),
                                            color: ColorConstant.green900),
                                      ])),
                                  Padding(
                                      padding: getPadding(
                                        left: 8,
                                        top: 7,
                                        bottom: 10,
                                      ),
                                      child: Text("Path Points Award: 25",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtInterSemiBold20Green900
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.98)))),
                                  Padding(
                                    padding: getPadding(
                                      left: 8,
                                      top: 7,
                                      bottom: 20,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Future Paths"),
                                            content: Text(
                                                "Are you sure you want to add this path to your Future Paths?"),
                                            actions: [
                                              TextButton(
                                                  child: Text("Yes"),
                                                  onPressed: () {
                                                    MyDatabase.instance
                                                        .readHP2state(curr_user)
                                                        .then((value) {
                                                      if (value.username !=
                                                          "") {
                                                        HP2forUser p =
                                                            HP2forUser(
                                                          id: value.id,
                                                          username: curr_user
                                                              .username,
                                                          state: "F",
                                                        );
                                                        MyDatabase.instance
                                                            .updHP2(p);
                                                      } else {
                                                        HP2forUser p =
                                                            HP2forUser(
                                                          username: curr_user
                                                              .username,
                                                          state: "F",
                                                        );
                                                        MyDatabase.instance
                                                            .createHP2forUser(
                                                                p);
                                                      }
                                                    });
                                                    Navigator.pop(context);
                                                  }),
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
                                        "Add to Future Paths",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterSemiBold20
                                            .copyWith(
                                          height: getVerticalSize(
                                            1.98,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height: screenHeight * 0.5,
                                      width: size.width,
                                      child: MyMap(
                                        title: title,
                                        zoom: zoom,
                                        markers: markers,
                                      )),
                                  Padding(
                                      padding: getPadding(left: 18, top: 16),
                                      child: Text("lbl_photos".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold24
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.65)))),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 16, top: 7, right: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgPhoto1518806114,
                                                    height: getVerticalSize(
                                                        screenHeight * 0.3),
                                                    width: getHorizontalSize(
                                                        screenWidth * 0.45),
                                                    margin: getMargin(
                                                        top: 6, bottom: 3)),
                                                CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgPhoto1518806115,
                                                  height: getVerticalSize(
                                                      screenHeight * 0.3),
                                                  width: getHorizontalSize(
                                                      screenWidth * 0.45),
                                                )
                                              ]))),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 20, top: 7, right: 0),
                                          child: Row(children: [
                                            Container(
                                                width: screenWidth * 0.35,
                                                child: Text("Description",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterSemiBold24
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.65)))),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgVolumeBlack900,
                                                height: getVerticalSize(40.00),
                                                width: getHorizontalSize(40.00),
                                                margin: getMargin(
                                                    top: 0,
                                                    bottom: 0,
                                                    right: 10),
                                                onTap: () {
                                                  AudioPlayer().play(AssetSource(
                                                      'audio/audio_imittos_path2.mp3'));
                                                }),
                                            Container(
                                              width: getHorizontalSize(
                                                  screenWidth * 0.4),
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
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          width: getHorizontalSize(368.00),
                                          margin: getMargin(top: 5),
                                          child: Text(
                                              "msg_explore_this_12_4_km".tr,
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 4 * _value))))
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

  onTapHome() {
    Get.toNamed(AppRoutes.homeDefaultScreen);
  }

  onTapHymettus() {
    Get.toNamed(AppRoutes.imitosScreen);
  }
}

Widget title = Text("Kesariani Monasteri - Terpsithea");
double zoom = 14.0;
Set<Marker> markers = {
  Marker(
      markerId: MarkerId("Kesariani Monasteri"),
      position: LatLng(37.960875567029724, 23.797900932253928),
      infoWindow: InfoWindow(title: "Kesariani Monasteri")),
  Marker(
      markerId: MarkerId("Terpsithea"),
      position: LatLng(37.961726887627606, 23.795986078979052),
      infoWindow: InfoWindow(title: "Terpsithea")),
};
