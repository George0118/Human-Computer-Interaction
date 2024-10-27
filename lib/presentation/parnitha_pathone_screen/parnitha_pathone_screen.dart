import 'controller/parnitha_pathone_controller.dart';
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
import 'package:my_app/db/model/parnithapathone.dart';
import 'package:my_app/db/model/user.dart';
import 'package:my_app/db/model/rating.dart';

class ParnithaPathoneScreen extends StatefulWidget {
  @override
  _ParnithaPathoneScreenState createState() => _ParnithaPathoneScreenState();
}

class _ParnithaPathoneScreenState extends State<ParnithaPathoneScreen> {
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
    await MyDatabase.instance.readRatingforPath("PP1").then((value) {
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
                              onTap: onTapImageThree2),
                          AppbarTitle(
                              text: "lbl_parnitha".tr,
                              margin: getMargin(top: 25, bottom: 25),
                              onTap: onTapParnitha),
                        ]))),
                body: SizedBox(
                    width: size.width,
                    child: SingleChildScrollView(
                        child: Container(
                            width: size.width,
                            margin: getMargin(top: 8),
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: getHorizontalSize(screenWidth),
                                      margin: getMargin(left: 10, top: 10),
                                      child: Text("msg_thrakomakedones3".tr,
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
                                                        .readPP1state(curr_user)
                                                        .then((value) {
                                                      if (value.username !=
                                                          "") {
                                                        PP1forUser p =
                                                            PP1forUser(
                                                          id: value.id,
                                                          username: curr_user
                                                              .username,
                                                          state: "F",
                                                        );
                                                        MyDatabase.instance
                                                            .updPP1(p);
                                                      } else {
                                                        PP1forUser p =
                                                            PP1forUser(
                                                          username: curr_user
                                                              .username,
                                                          state: "F",
                                                        );
                                                        MyDatabase.instance
                                                            .createPP1forUser(
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
                                      padding: getPadding(left: 19, top: 18),
                                      child: Text("lbl_photos".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold24
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.65)))),
                                  Padding(
                                      padding: getPadding(
                                          left: 8, top: 29, right: 26),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgPhoto151880611147x162,
                                                height: getVerticalSize(
                                                    screenHeight * 0.3),
                                                width: getHorizontalSize(
                                                    screenWidth * 0.45)),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgPhoto151880611147x180,
                                                height: getVerticalSize(
                                                    screenHeight * 0.3),
                                                width: getHorizontalSize(
                                                    screenWidth * 0.45))
                                          ])),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 16, top: 7, right: 18),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width: screenWidth * 0.35,
                                                    child: Text("Description",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterSemiBold24
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.65)))),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgVolumeBlack900,
                                                    height:
                                                        getVerticalSize(40.00),
                                                    width: getHorizontalSize(
                                                        40.00),
                                                    margin: getMargin(
                                                        top: 0,
                                                        bottom: 0,
                                                        right: 10),
                                                    onTap: () {
                                                      AudioPlayer().play(
                                                          AssetSource(
                                                              'audio/audio_parnitha_path1.mp3'));
                                                    }),
                                                Container(
                                                  width: getHorizontalSize(
                                                      screenWidth * 0.4),
                                                  decoration: new BoxDecoration(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      borderRadius:
                                                          new BorderRadius.all(
                                                              new Radius
                                                                      .circular(
                                                                  5.0)),
                                                      boxShadow: [
                                                        new BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    96,
                                                                    82,
                                                                    82,
                                                                    82),
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
                                          child: Text("msg".tr,
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

  onTapImageThree2() {
    Get.toNamed(AppRoutes.homeDefaultScreen);
  }

  onTapParnitha() {
    Get.toNamed(AppRoutes.parnithaScreen);
  }
}

Widget title = Text("Thrakomakedones - Chouni Gorge - Mpafi");
double zoom = 14.0;
Set<Marker> markers = {
  Marker(
      markerId: MarkerId("Thrakomakedones"),
      position: LatLng(38.13804378227405, 23.73884678089611),
      infoWindow: InfoWindow(title: "Thrakomakedones")),
  Marker(
      markerId: MarkerId("Chouni Gorge"),
      position: LatLng(38.840926602665064, 21.536307244899845),
      infoWindow: InfoWindow(title: "Chouni Gorge")),
  Marker(
      markerId: MarkerId("Mpafi"),
      position: LatLng(38.167499173513406, 23.727179045891667),
      infoWindow: InfoWindow(title: "Mpafi")),
};
