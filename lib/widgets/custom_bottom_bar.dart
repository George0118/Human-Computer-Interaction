import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  
  CustomBottomBar({this.onChanged, currentIndex});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeGreen900,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlay,
      title: "Trip",
      type: BottomBarEnum.Trip,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      title: "Me",
      type: BottomBarEnum.Me,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: getVerticalSize(
            2.00,
          ),
          width: getHorizontalSize(
            413.00,
          ),
          decoration: BoxDecoration(
            color: ColorConstant.green900,
          ),
        ),
        Obx(
          () => Container(
            margin: getMargin(
              right: 1,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: ColorConstant.green900,
              unselectedItemColor: ColorConstant.green900,
              elevation: 0,
              currentIndex: selectedIndex.value,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomMenuList.length, (index) {
                return BottomNavigationBarItem(
                  icon: CustomImageView(
                    svgPath: bottomMenuList[index].icon,
                    height: getVerticalSize(
                      22.00,
                    ),
                    width: getHorizontalSize(
                      24.00,
                    ),
                    color: ColorConstant.green900,
                  ),
                  activeIcon: CustomImageView(
                    svgPath: bottomMenuList[index].icon,
                    height: getVerticalSize(
                      22.00,
                    ),
                    width: getHorizontalSize(
                      24.00,
                    ),
                    color: ColorConstant.green900,
                  ),
                  label: bottomMenuList[index].title,
                );
              }),
              onTap: (index) {
                //selectedIndex.value = index;
                onChanged!(bottomMenuList[index].type);
              },
            ),
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  Home,
  Trip,
  Me,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, required this.title, required this.type});

  String icon;

  String title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
