import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/login_screen/auth.dart';
import 'controller/login_controller.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:my_app/presentation/signin_screen/signin_screen.dart';
import 'package:my_app/db/database.dart';
import 'package:my_app/db/model/user.dart';
import 'dart:developer';

class LoginScreen extends GetWidget<LoginController> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void show_Simple_Snackbar(BuildContext context) {
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      title: "Oops!",
      message: "There is no user with these credentials.",
      backgroundColor: ColorConstant.green900,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(150.00),
        title: Row(children: [
          AppbarImage(
              height: getVerticalSize(100.00),
              width: getHorizontalSize(117.00),
              imagePath: ImageConstant.imgImage3,
              margin: getMargin(left: 9)),
          Text("Happy Trails",
              style: TextStyle(color: ColorConstant.green900, fontSize: 35))
        ]),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            onTapSignUp();
          },
          onTap: () {},
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Center(
                    child: Container(
                        width: 200,
                        height: 75,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Text("Login",
                            style: TextStyle(
                                color: ColorConstant.green900, fontSize: 35)),
                        margin: getMargin(left: 115, top: 20))),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter your username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
                ),
              ),
              TextButton(
                onPressed: () {
                  onTapForgotPassword();
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: ColorConstant.green900, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: ColorConstant.green900,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (usernameController.text == "" ||
                        passwordController.text == "") {
                      show_Simple_Snackbar(context);
                    } else {
                      MyDatabase.instance
                          .readUser(
                              usernameController.text, passwordController.text)
                          .then((curr_user) {
                        if (curr_user.username != "") {
                          User user = User(
                              id: curr_user.id,
                              username: curr_user.username,
                              password: curr_user.password,
                              email: curr_user.email,
                              curr: true,
                              fp: curr_user.fp);
                          MyDatabase.instance.readCurrUsers().then((value) {
                            if (value.isEmpty) {
                              log("No current users found");
                              MyDatabase.instance
                                  .setCurrUser(user)
                                  .then((value) {
                                onTapHomeDefault();
                              });
                            } else {
                              log("current users found");
                              log("One of them is " + value[0].username);
                              MyDatabase.instance
                                  .setCurrUserstonormal(value)
                                  .then((value) {
                                MyDatabase.instance
                                    .setCurrUser(user)
                                    .then((value) {
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
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Padding(padding: getMargin(top: 60)),
              Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.green900),
                      borderRadius: BorderRadius.circular(20)),
                  child: LocalAuth()),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  onTapSignUp();
                },
                child: Text(
                  'Not a user? Sign Up!',
                  style: TextStyle(color: ColorConstant.green900, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  onTapHomeDefault() {
    Get.toNamed(AppRoutes.homeDefaultScreen);
  }

  onTapSignUp() {
    Get.toNamed(AppRoutes.signinScreen);
  }

  onTapForgotPassword() {
    Get.toNamed(AppRoutes.forgotpasswordScreen);
  }
}
