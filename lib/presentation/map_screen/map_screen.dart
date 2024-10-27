import 'package:my_app/presentation/google_maps.dart/google_maps.dart';

import 'controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/otherprofiles_page.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends GetWidget<MapController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: size.width,
                child: MyMap(title: title, zoom: zoom, markers: markers)),
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

  static onTapTxtHymmetus() {
    Get.toNamed(AppRoutes.imitosScreen);
  }

  static onTapTxtParnitha() {
    Get.toNamed(AppRoutes.parnithaScreen);
  }

  Widget title = Text("Search for mountains near you");
  double zoom = 8.0;
  Set<Marker> markers = {
    Marker(
        markerId: MarkerId("Parnitha"),
        position: LatLng(38.175219925386095, 23.716813761239298),
        infoWindow: InfoWindow(
            title: "Parnitha",
            onTap: () {
              onTapTxtParnitha();
            })),
    Marker(
        markerId: MarkerId("Hymettus"),
        position: LatLng(37.94689565928076, 23.816623745790015),
        infoWindow: InfoWindow(
            title: "Hymettus",
            onTap: () {
              onTapTxtHymmetus();
            })),
  };

}
