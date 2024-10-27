import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/db/database.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'dart:developer';
import "package:my_app/db/model/user.dart";

class LocalAuth extends StatefulWidget {
  const LocalAuth({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LocalAuth createState() => _LocalAuth();
}

class _LocalAuth extends State<LocalAuth> {
  bool authenticated = false;

  static final _auth = LocalAuthentication();

  static Future<bool> canauth() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await canauth()) {
        return false;
      }

      return await _auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint('error $e');
      return false;
    }
  }

  void show_Simple_Snackbar(BuildContext context) {
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      title: "Oops!",
      message: "This fingerprint does not match a user.",
      backgroundColor: ColorConstant.green900,
    )..show(context);
  }

  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () async {
            final authent = await authenticate();
            setState(() {
              authenticated = authent;
            });
            if (authenticated == true) {
              MyDatabase.instance.readFPUser().then((fpuser) {
                if (fpuser.username != "") {
                  log("FPuser is " + fpuser.username);
                  User curr_user = User(
                              id: fpuser.id,
                              username: fpuser.username,
                              password: fpuser.password,
                              email: fpuser.email,
                              curr: true,
                              fp: fpuser.fp);
                  MyDatabase.instance.readCurrUsers().then((list) {
                    if (list.isEmpty) {
                      MyDatabase.instance.setCurrUser(curr_user).then((value) {
                        log("FPuser is " + value.toString());
                        onTapHomeDefault();
                      });
                    } else {
                      MyDatabase.instance
                          .setCurrUserstonormal(list)
                          .then((value) {
                        MyDatabase.instance.setCurrUser(curr_user).then((value) {
                          onTapHomeDefault();
                        });
                      });
                    }
                  });
                } else {
                  show_Simple_Snackbar(context);
                }
              });
            }
          },
          child: Center(
            child: const Text(
              'Authorize with fingerprint',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 92, 3), fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }

  onTapHomeDefault() {
    Get.toNamed(AppRoutes.homeDefaultScreen);
  }
}
