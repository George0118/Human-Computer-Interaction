import 'package:my_app/presentation/home_default_screen/home_default_screen.dart';
import 'package:my_app/presentation/home_default_screen/binding/home_default_binding.dart';
import 'package:my_app/presentation/login_screen/login_screen.dart';
import 'package:my_app/presentation/login_screen/binding/login_binding.dart';
import 'package:my_app/presentation/signin_screen/signin_screen.dart';
import 'package:my_app/presentation/signin_screen/binding/signin_binding.dart';
import 'package:my_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:my_app/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:my_app/presentation/parnitha_screen/parnitha_screen.dart';
import 'package:my_app/presentation/parnitha_screen/binding/parnitha_binding.dart';
import 'package:my_app/presentation/map_screen/map_screen.dart';
import 'package:my_app/presentation/map_screen/binding/map_binding.dart';
import 'package:my_app/presentation/imitos_screen/imitos_screen.dart';
import 'package:my_app/presentation/imitos_screen/binding/imitos_binding.dart';
import 'package:my_app/presentation/trips_screen/trips_screen.dart';
import 'package:my_app/presentation/trips_screen/binding/trips_binding.dart';
import 'package:my_app/presentation/parnitha_pathone_screen/parnitha_pathone_screen.dart';
import 'package:my_app/presentation/parnitha_pathone_screen/binding/parnitha_pathone_binding.dart';
import 'package:my_app/presentation/parnitha_pathtwo_screen/parnitha_pathtwo_screen.dart';
import 'package:my_app/presentation/parnitha_pathtwo_screen/binding/parnitha_pathtwo_binding.dart';
import 'package:my_app/presentation/imittos_pathone_screen/imittos_pathone_screen.dart';
import 'package:my_app/presentation/imittos_pathone_screen/binding/imittos_pathone_binding.dart';
import 'package:my_app/presentation/imittos_pathtwo_screen/imittos_pathtwo_screen.dart';
import 'package:my_app/presentation/imittos_pathtwo_screen/binding/imittos_pathtwo_binding.dart';
import 'package:my_app/presentation/otherprofiles_container_screen/otherprofiles_container_screen.dart';
import 'package:my_app/presentation/otherprofiles_container_screen/binding/otherprofiles_container_binding.dart';
import 'package:my_app/presentation/friends_screen/friends_screen.dart';
import 'package:my_app/presentation/friends_screen/binding/friends_binding.dart';
import 'package:my_app/presentation/me_screen/me_screen.dart';
import 'package:my_app/presentation/me_screen/binding/me_binding.dart';
import 'package:my_app/presentation/usertwo_screen/usertwo_screen.dart';
import 'package:my_app/presentation/usertwo_screen/binding/usertwo_binding.dart';
import 'package:my_app/presentation/userthree_screen/userthree_screen.dart';
import 'package:my_app/presentation/userthree_screen/binding/userthree_binding.dart';
import 'package:my_app/presentation/friendone_screen/friendone_screen.dart';
import 'package:my_app/presentation/friendone_screen/binding/friendone_binding.dart';
import 'package:my_app/presentation/friendtwo_screen/friendtwo_screen.dart';
import 'package:my_app/presentation/friendtwo_screen/binding/friendtwo_binding.dart';
import 'package:my_app/presentation/photoone_screen/photoone_screen.dart';
import 'package:my_app/presentation/photoone_screen/binding/photoone_binding.dart';
import 'package:my_app/presentation/photo_me_screen/photo_me_screen.dart';
import 'package:my_app/presentation/photo_me_screen/binding/photo_me_binding.dart';
import 'package:my_app/presentation/settings_screen/settings_screen.dart';
import 'package:my_app/presentation/settings_screen/binding/settings_binding.dart';
import 'package:my_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:my_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String homeDefaultScreen = '/home_default_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotpasswordScreen = '/forgot_password_screen';

  static const String signinScreen = '/signin_screen';

  static const String parnithaScreen = '/parnitha_screen';

  static const String mapScreen = '/map_screen';

  static const String imitosScreen = '/imitos_screen';

  static const String tripsScreen = '/trips_screen';

  static const String parnithaPathoneScreen = '/parnitha_pathone_screen';

  static const String parnithaPathtwoScreen = '/parnitha_pathtwo_screen';

  static const String imittosPathoneScreen = '/imittos_pathone_screen';

  static const String imittosPathtwoScreen = '/imittos_pathtwo_screen';

  static const String otherprofilesPage = '/otherprofiles_page';

  static const String otherprofilesContainerScreen =
      '/otherprofiles_container_screen';

  static const String friendsScreen = '/friends_screen';

  static const String meScreen = '/me_screen';

  static const String usertwoScreen = '/usertwo_screen';

  static const String userthreeScreen = '/userthree_screen';

  static const String friendoneScreen = '/friendone_screen';

  static const String friendtwoScreen = '/friendtwo_screen';

  static const String photooneScreen = '/photoone_screen';

  static const String photo_meScreen = '/photo_me_screen';

  static const String settingsScreen = '/settings_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homeDefaultScreen,
      page: () => HomeDefaultScreen(),
      bindings: [
        HomeDefaultBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: forgotpasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: signinScreen,
      page: () => SigninScreen(),
      bindings: [
        SigninBinding(),
      ],
    ),
    GetPage(
      name: parnithaScreen,
      page: () => ParnithaScreen(),
      bindings: [
        ParnithaBinding(),
      ],
    ),
    GetPage(
      name: mapScreen,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: imitosScreen,
      page: () => ImitosScreen(),
      bindings: [
        ImitosBinding(),
      ],
    ),
    GetPage(
      name: tripsScreen,
      page: () => TripsScreen(),
      bindings: [
        TripsBinding(),
      ],
    ),
    GetPage(
      name: parnithaPathoneScreen,
      page: () => ParnithaPathoneScreen(),
      bindings: [
        ParnithaPathoneBinding(),
      ],
    ),
    GetPage(
      name: parnithaPathtwoScreen,
      page: () => ParnithaPathtwoScreen(),
      bindings: [
        ParnithaPathtwoBinding(),
      ],
    ),
    GetPage(
      name: imittosPathoneScreen,
      page: () => ImittosPathoneScreen(),
      bindings: [
        ImittosPathoneBinding(),
      ],
    ),
    GetPage(
      name: imittosPathtwoScreen,
      page: () => ImittosPathtwoScreen(),
      bindings: [
        ImittosPathtwoBinding(),
      ],
    ),
    GetPage(
      name: otherprofilesContainerScreen,
      page: () => OtherprofilesContainerScreen(),
      bindings: [
        OtherprofilesContainerBinding(),
      ],
    ),
    GetPage(
      name: friendsScreen,
      page: () => FriendsScreen(),
      bindings: [
        FriendsBinding(),
      ],
    ),
    GetPage(
      name: meScreen,
      page: () => MeScreen(),
      bindings: [
        MeBinding(),
      ],
    ),
    GetPage(
      name: usertwoScreen,
      page: () => UsertwoScreen(),
      bindings: [
        UsertwoBinding(),
      ],
    ),
    GetPage(
      name: userthreeScreen,
      page: () => UserthreeScreen(),
      bindings: [
        UserthreeBinding(),
      ],
    ),
    GetPage(
      name: friendoneScreen,
      page: () => FriendoneScreen(),
      bindings: [
        FriendoneBinding(),
      ],
    ),
    GetPage(
      name: friendtwoScreen,
      page: () => FriendtwoScreen(),
      bindings: [
        FriendtwoBinding(),
      ],
    ),
    GetPage(
      name: photooneScreen,
      page: () => PhotooneScreen(),
      bindings: [
        PhotooneBinding(),
      ],
    ),
    GetPage(
      name: photo_meScreen,
      page: () => Photo_meScreen(),
      bindings: [
        Photo_meBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    )
  ];
}
