import 'package:my_app/widgets/custom_icon_button.dart';
import 'dart:developer';
import 'controller/trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:my_app/widgets/custom_drop_down.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/presentation/trips_screen/models/dragable_list.dart';
import 'package:my_app/presentation/trips_screen/models/dragable_list_data.dart';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/user.dart';
import 'package:my_app/db/model/hymettuspathone.dart';
import 'package:my_app/db/model/hymettuspathtwo.dart';
import 'package:my_app/db/model/parnithapathone.dart';
import 'package:my_app/db/model/parnithapathtwo.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/db/model/rating.dart';

late List<List> current_list = [[], [], []];
int pasttripsindex = 2;

void show_Simple_Snackbar(BuildContext context) {
  Flushbar(
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 6),
    title: "Congratulations! You have completed a path!",
    message:
        "Check your new points total and set new paths for future travels!",
    backgroundColor: ColorConstant.green900,
  )..show(context);
}

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreen createState() => _TripsScreen();
}

class _TripsScreen extends State<TripsScreen> {
  late List<DragAndDropList> lists;
  List<String> states = ["", "", "", ""];
  late List<DragAndDropItem> current = [];
  late List<DragAndDropItem> future = [];
  late List<DragAndDropItem> past = [];
  late PP1forUser curr_PP1;
  late PP2forUser curr_PP2;
  late HP1forUser curr_HP1;
  late HP2forUser curr_HP2;
  late double rate;
  List<String> enum_states = ['C', 'F', 'P'];
  List<String> states_order = ['C', 'F', 'P'];
  List<Function> onTap = [
    onTapTxtLanguage,
    onTapTxtLanguageOne,
    onTapTxtThrakomakedonesOne,
    onTapTxtMpafiSkipiza
  ];
  List<String> dbpaths = ["HP1", "HP2", "PP1", "PP2"];
  List<String> path = [
    "Kesariani Fire Lookout Station - Kalopoula",
    "Kesariani Monastery - Terpsithea",
    "Thrakomakedones - Chouni Gorge - Mpafi",
    "Mpafi - Skipiza - Mola - Mpafi"
  ];
  late User curr_user;
  bool isLoading = false;

  Future getUser() async {
    setState(() => isLoading = true);

    await MyDatabase.instance.readCurr().then((curr_user) {
      getData(curr_user).then(
        (states) {
          for (int j = 0; j < 4; j++) {
            DragAndDropItem i = DragAndDropItem(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: getMargin(left: 0, right: 50),
                      width: size.width,
                      child: GestureDetector(
                        child: TextButton(
                            onPressed: () => onTap[j](),
                            child: Text(
                              path[j],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: ColorConstant.green900),
                            )),
                        onHorizontalDragStart: (details) {
                          if (current_list[pasttripsindex].contains(j)) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Rate this path!"),
                                content: RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: ColorConstant.green900,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                    rate = rating;
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () async {
                                      await MyDatabase.instance
                                          .readRating(
                                              curr_user.username, dbpaths[j])
                                          .then((value) {
                                        Rating r = Rating(
                                            username: curr_user.username,
                                            path: dbpaths[j],
                                            rate: rate);
                                        if (value.username == "") {
                                          MyDatabase.instance.createRating(r);
                                        } else {
                                          MyDatabase.instance.updRating(r);
                                        }
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      )),
                ],
              ),
            );

            if (states[j] == 'C') {
              current.insert(0, i);
              current_list[0].insert(0, j);
            } else if (states[j] == 'F') {
              future.insert(0, i);
              current_list[1].insert(0, j);
            } else if (states[j] == 'P') {
              past.insert(0, i);
              current_list[2].insert(0, j);
            }
          }

          setState(() {
            isLoading = false;
            this.curr_user = curr_user;
          });
        },
      );
    });
  }

  Future<List<String>> getData(User user) async {
    curr_HP1 = await MyDatabase.instance.readHP1state(user).then((value) {
      if (value.username != "") {
        states[0] = value.state;
        return value;
      } else {
        states[0] = "";
        return HP1forUser(username: "", state: "");
      }
    });

    curr_HP2 = await MyDatabase.instance.readHP2state(user).then((value) {
      if (value.username != "") {
        states[1] = value.state;
        return value;
      } else {
        states[1] = "";
        return HP2forUser(username: "", state: "");
      }
    });

    curr_PP1 = await MyDatabase.instance.readPP1state(user).then((value) {
      if (value.username != "") {
        states[2] = value.state;
        return value;
      } else {
        states[2] = "";
        return PP1forUser(username: "", state: "");
      }
    });

    curr_PP2 = await MyDatabase.instance.readPP2state(user).then((value) {
      if (value.username != "") {
        states[3] = value.state;
        return value;
      } else {
        states[3] = "";
        return PP2forUser(username: "", state: "");
      }
    });
    log(states[2]);
    return states;
  }

  @override
  void initState() {
    super.initState();

    log("I am in initState I should rebuild lists");

    getUser().then(
      (value) {
        lists = [
          DragAndDropList(
            contentsWhenEmpty: Text("Feel free to add items here!",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorConstant.black900)),
            canDrag: false,
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
                margin: getMargin(left: 10, bottom: 5),
                svgPath: ImageConstant.imgCamera,
                onTap: (() async {
                  onTapImgCamera();
                }),
              )
            ]),
            children: current,
          ),
          DragAndDropList(
            contentsWhenEmpty: Text("Feel free to add items here!",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorConstant.black900)),
            canDrag: false,
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
            children: future,
          ),
          DragAndDropList(
            contentsWhenEmpty: Text("Feel free to add items here!",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorConstant.black900)),
            canDrag: false,
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
            children: past,
          )
        ];
        log(states[2]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromARGB(255, 243, 242, 248);

    return isLoading
        ? Text("Loading...",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorConstant.black900))
        : Scaffold(
            backgroundColor: backgroundColor,
            appBar: CustomAppBar(
              height: size.height * 0.2,
              leadingWidth: size.height * 0.2,
              leading: Card(
                  margin: getMargin(top: 23, left: 23, right: 23, bottom: 15),
                  elevation: 0,
                  color: backgroundColor,
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
            ),
            body: Container(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Drag on paths you have visited to rate them!",
                  style:
                      TextStyle(fontSize: 16, color: ColorConstant.green900)),
              Expanded(
                  child: DragAndDropLists(
                listPadding: EdgeInsets.all(10),
                listInnerDecoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: ColorConstant.green900),
                  borderRadius: BorderRadius.circular(10),
                ),
                children: lists,
                itemDivider: Divider(
                    thickness: 1, height: 0, color: ColorConstant.green900),
                itemDecorationWhileDragging: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(color: ColorConstant.green900, blurRadius: 4)
                  ],
                ),
                listDragHandle: buildDragHandle(isList: true),
                itemDragHandle: buildDragHandle(),
                itemDragOnLongPress: true,
                listDragOnLongPress: true,
                onItemReorder: onReorderListItem,
                onListReorder: onReorderList,
              )),
            ])),
            bottomNavigationBar: CustomBottomBar(
              onChanged: (BottomBarEnum type) {
                Get.toNamed(getCurrentRoute(type));
              },
            ),
          );
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? ColorConstant.green900 : ColorConstant.green900;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: getMargin(left: 100),
        margin: const EdgeInsets.all(10.0),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      if (current_list[oldListIndex][oldItemIndex] == 0) {
        HP1forUser p = HP1forUser(
            id: curr_HP1.id,
            username: curr_user.username,
            state: states_order[newListIndex]);
        MyDatabase.instance.updHP1(p);
      } else if (current_list[oldListIndex][oldItemIndex] == 1) {
        HP2forUser p = HP2forUser(
            id: curr_HP2.id,
            username: curr_user.username,
            state: states_order[newListIndex]);
        MyDatabase.instance.updHP2(p);
      } else if (current_list[oldListIndex][oldItemIndex] == 2) {
        PP1forUser p = PP1forUser(
            id: curr_PP1.id,
            username: curr_user.username,
            state: states_order[newListIndex]);
        log("going to update PP1 for user");
        MyDatabase.instance.updPP1(p);
      } else if (current_list[oldListIndex][oldItemIndex] == 3) {
        PP2forUser p = PP2forUser(
            id: curr_PP2.id,
            username: curr_user.username,
            state: states_order[newListIndex]);
        MyDatabase.instance.updPP2(p);
      }

      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);

      List oldList = current_list[oldListIndex];
      List newList = current_list[newListIndex];
      int moving_item = oldList.removeAt(oldItemIndex);
      newList.insert(newItemIndex, moving_item);

      if (newListIndex == pasttripsindex) {
        show_Simple_Snackbar(context);
      }
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);

      List moving_list = current_list.removeAt(oldListIndex);
      current_list.insert(newListIndex, moving_list);

      String moving_state = states_order.removeAt(oldListIndex);
      states_order.insert(newListIndex, moving_state);

      if (oldListIndex == pasttripsindex) {
        pasttripsindex = newListIndex;
      }
    });
  }
}

onTapImgCamera() async {
  await PermissionManager.askForPermission(Permission.camera);
  await PermissionManager.askForPermission(Permission.storage);

  var image = await ImagePicker().getImage(source: ImageSource.camera);
  if (image == null) return;
  GallerySaver.saveImage(image.path);
}

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
