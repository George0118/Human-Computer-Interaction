import 'package:my_app/presentation/photo_me_screen/photo_me_screen.dart';

import 'controller/me_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/presentation/photoone_screen/photoone_screen.dart';
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
import 'dart:math' as math;
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';

class MeScreen extends StatefulWidget {
  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  late User curr_user;
  bool isLoading = false;
  int sum = 0;
  List<int> visited = [0, 0, 0, 0];
  List<int> paths_that_can_have_photos = [0, 0, 0, 0];
  List<String> db_paths = ["HP1", "HP2", "PP1", "PP2"];
  List<String> paths = [
    "Kesariani Fire Lookout Station - Kalopoula",
    "Kesariani Monastery - Terpsithea",
    "Thrakomakedones - Chouni Gorge - Mpafi",
    "Mpafi - Skipiza - Mola - Mpafi"
  ];
  late PP1forUser curr_PP1;
  late PP2forUser curr_PP2;
  late HP1forUser curr_HP1;
  late HP2forUser curr_HP2;

  late Future<File> imageFile;
  late Image image;
  late List<List<Photo>> images = [[], [], [], []];
  late List<List<Padding>> list = [[], [], [], []];

  List<Function> onTap = [
    onTapTxtLanguage,
    onTapTxtLanguageOne,
    onTapTxtThrakomakedonesOne,
    onTapTxtMpafiSkipiza
  ];

  List<List<Padding>> make_list() {
    List<List<Padding>> list = [[], [], [], []];
    log("I am making a list");
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < images[i].length; j++) {
        log("heeeey! there are images now!");
        Image img = Utility.imageFromBase64String(images[i][j].photo_name);
        Padding p = Padding(
          padding: EdgeInsets.all(5.0),
          child: img,
        );
        list[i].add(p);
      }
    }

    return list;
  }

  refreshImages() {
    log("I am refreshing images");
    images = [[], [], [], []];
    for (int i = 0; i < 4; i++) {
      if (paths_that_can_have_photos[i] == 1) {
        MyDatabase.instance
            .getPhotos(curr_user.username, db_paths[i])
            .then((imgs) {
          setState(() {
            images[i].clear();
            images[i].addAll(imgs);
          });
        });
      }
    }
    setState(() {
      list = make_list();
    });
  }

  pickImageFromGallery(String path) {
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
      if (imgFile != null) {
        String imgString = Utility.base64String(await imgFile.readAsBytes());
        Photo photo = Photo(
            username: curr_user.username, photo_name: imgString, path: path);
        MyDatabase.instance.save(photo).then((value) {
          refreshImages();
        });
        setState(() {
          list = make_list();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future getData(User user) async {
    curr_HP1 = await MyDatabase.instance.readHP1state(user).then((value) {
      if (value.username != "") {
        if (value.state == 'P') {
          visited[0] = 1;
          paths_that_can_have_photos[0] = 1;
        } else if (value.state == 'C') {
          paths_that_can_have_photos[0] = 1;
        }
        log("visited[0] = " + visited[0].toString());
        log("paths_that_can_have_photos[0] " +
            paths_that_can_have_photos[0].toString());
        return value;
      } else {
        return HP1forUser(username: "", state: "");
      }
    });

    curr_HP2 = await MyDatabase.instance.readHP2state(user).then((value) {
      if (value.username != "") {
        if (value.state == 'P') {
          visited[1] = 1;
          paths_that_can_have_photos[1] = 1;
        } else if (value.state == 'C') {
          paths_that_can_have_photos[1] = 1;
        }
        return value;
      } else {
        return HP2forUser(username: "", state: "");
      }
    });

    curr_PP1 = await MyDatabase.instance.readPP1state(user).then((value) {
      if (value.username != "") {
        if (value.state == 'P') {
          log("I am in here");
          visited[2] = 1;
          paths_that_can_have_photos[2] = 1;
        } else if (value.state == 'C') {
          paths_that_can_have_photos[2] = 1;
        }
        return value;
      } else {
        return PP1forUser(username: "", state: "");
      }
    });

    curr_PP2 = await MyDatabase.instance.readPP2state(user).then((value) {
      if (value.username != "") {
        if (value.state == 'P') {
          visited[3] = 1;
          paths_that_can_have_photos[3] = 1;
        } else if (value.state == 'C') {
          paths_that_can_have_photos[3] = 1;
        }
        return value;
      } else {
        return PP2forUser(username: "", state: "");
      }
    });
  }

  listView(int i) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: images[i].map((photo) {
          return GestureDetector(
              onTap: () {
                onTapImgImage(i, images[i].indexOf(photo), images[i]);
              },
              child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Utility.imageFromBase64String(photo.photo_name))));
        }).toList(),
      ),
    );
  }

  Future getUser() async {
    setState(() => isLoading = true);

    await MyDatabase.instance.readCurr().then(
      (curr_user) {
        getData(curr_user).then((value) {
          for (int j = 0; j < 4; j++) {
            if (visited[j] == 1) {
              this.sum++;
            }
          }
          log("sum = " + sum.toString());
          log("visited[2] = " + visited[2].toString());

          setState(() {
            this.curr_user = curr_user;
            refreshImages();
            isLoading = false;
          });
        });
      },
    );
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
                        margin: getMargin(left: 0, top: 32, bottom: 28)),
                    actions: [
                      AppbarSubtitle(
                          text: "lbl_logout".tr,
                          margin:
                              getMargin(left: 0, top: 60, bottom: 0, right: 50),
                          onTap: () {
                            MyDatabase.instance
                                .readUser(
                                    curr_user.username, curr_user.password)
                                .then((curr_user) {
                              curr_user = User(
                                  id: curr_user.id,
                                  username: curr_user.username,
                                  password: curr_user.password,
                                  email: curr_user.email,
                                  curr: false,
                                  fp: curr_user.fp);
                              MyDatabase.instance.setCurrUser(curr_user).then(
                                  (value) {
                                onTapLogout();
                              }, onError: (e) {});
                            }, onError: (e) {});
                          }),
                    ]),
                body: SizedBox(
                    width: size.width,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: getPadding(left: 22, top: 0, bottom: 30),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Path Points: " + (sum * 25).toString(),
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold20Green900
                                          .copyWith(
                                              height: getVerticalSize(1.98))),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtFriends();
                                      },
                                      child: Padding(
                                          padding: getMargin(top: 15),
                                          child: Text("lbl_friends".tr,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtInterSemiBold20Green900
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.98))))),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtCheckoutother();
                                      },
                                      child: Padding(
                                          padding: getPadding(top: 15),
                                          child: Text("msg_check_out_other".tr,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtInterSemiBold20Green900
                                                  .copyWith(
                                                      height: getVerticalSize(
                                                          1.98))))),
                                  Padding(
                                      padding: getPadding(top: 25),
                                      child: Text("lbl_your_photos".tr,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold32
                                              .copyWith(
                                                  height:
                                                      getVerticalSize(1.24)))),
                                  if (paths_that_can_have_photos[0] == 1)
                                    GestureDetector(
                                        onTap: () {
                                          onTap[0]();
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: size.width * 0.8,
                                                    child: Text(paths[0],
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterRegular20
                                                            .copyWith(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.98)))),
                                                Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationX(
                                                      math.pi),
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgDownload,
                                                    height: getSize(
                                                      35.00,
                                                    ),
                                                    width: getSize(
                                                      35.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 5,
                                                      top: 0,
                                                    ),
                                                    onTap: (() {
                                                      pickImageFromGallery(
                                                          "HP1");
                                                    }),
                                                  ),
                                                )
                                              ],
                                            ))),
                                  if (paths_that_can_have_photos[0] == 1)
                                    Padding(
                                        padding: getPadding(
                                            top: 20, right: 11, left: 0),
                                        child: SizedBox(
                                            height: 200, child: listView(0))),
                                  if (paths_that_can_have_photos[1] == 1)
                                    GestureDetector(
                                        onTap: () {
                                          onTap[1]();
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: size.width * 0.8,
                                                    child: Text(paths[1],
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterRegular20
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.98)))),
                                                Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationX(
                                                      math.pi),
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgDownload,
                                                    height: getSize(
                                                      35.00,
                                                    ),
                                                    width: getSize(
                                                      35.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 5,
                                                      top: 0,
                                                    ),
                                                    onTap: (() {
                                                      pickImageFromGallery(
                                                          "HP2");
                                                    }),
                                                  ),
                                                )
                                              ],
                                            ))),
                                  if (paths_that_can_have_photos[1] == 1)
                                    Padding(
                                        padding: getPadding(top: 20, right: 11),
                                        child: SizedBox(
                                            height: 200, child: listView(1))),
                                  if (paths_that_can_have_photos[2] == 1)
                                    GestureDetector(
                                        onTap: () {
                                          onTap[2]();
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: size.width * 0.8,
                                                    child: Text(paths[2],
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterRegular20
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.98)))),
                                                Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationX(
                                                      math.pi),
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgDownload,
                                                    height: getSize(
                                                      35.00,
                                                    ),
                                                    width: getSize(
                                                      35.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 5,
                                                      top: 0,
                                                    ),
                                                    onTap: (() {
                                                      pickImageFromGallery(
                                                          "PP1");
                                                    }),
                                                  ),
                                                )
                                              ],
                                            ))),
                                  if (paths_that_can_have_photos[2] == 1)
                                    Padding(
                                        padding: getPadding(top: 20, right: 11),
                                        child: SizedBox(
                                            height: 200, child: listView(2))),
                                  if (paths_that_can_have_photos[3] == 1)
                                    GestureDetector(
                                        onTap: () {
                                          onTap[3]();
                                        },
                                        child: Padding(
                                            padding: getPadding(top: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: size.width * 0.8,
                                                    child: Text(paths[3],
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtInterRegular20
                                                        .copyWith(
                                                            height:
                                                                getVerticalSize(
                                                                    1.98)))),
                                                Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationX(
                                                      math.pi),
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgDownload,
                                                    height: getSize(
                                                      35.00,
                                                    ),
                                                    width: getSize(
                                                      35.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 5,
                                                      top: 0,
                                                    ),
                                                    onTap: (() {
                                                      pickImageFromGallery(
                                                          "PP2");
                                                    }),
                                                  ),
                                                )
                                              ],
                                            ))),
                                  if (paths_that_can_have_photos[3] == 1)
                                    Padding(
                                        padding: getPadding(top: 20, right: 11),
                                        child: SizedBox(
                                            height: 200, child: listView(3))),
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

  onTapTxtFriends() {
    Get.toNamed(AppRoutes.friendsScreen);
  }

  onTapLogout() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapTxtCheckoutother() {
    Get.toNamed(AppRoutes.otherprofilesContainerScreen);
  }

  onTapImgImage(int index, int offset, List<Photo> list) {
    Get.toNamed(
      AppRoutes.photo_meScreen,
      arguments: Me_ScreenArguments(index, offset, list),
    );
  }
}

onTapTxtThrakomakedonesOne() {
  Get.toNamed(AppRoutes.parnithaPathoneScreen);
}

onTapTxtMpafiSkipiza() {
  Get.toNamed(AppRoutes.parnithaPathtwoScreen);
}

onTapTxtLanguage() {
  Get.toNamed(AppRoutes.imittosPathtwoScreen);
}

onTapTxtLanguageOne() {
  Get.toNamed(AppRoutes.imittosPathtwoScreen);
}
