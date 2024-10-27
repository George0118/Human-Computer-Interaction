import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'controller/signin_controller.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:my_app/db/database.dart';
import "package:my_app/db/model/user.dart";
import 'dart:developer';

class SigninScreen extends GetWidget<SigninController> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordconfirmationController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late bool flag;

  void show_Simple_Snackbar(
      BuildContext context, String title, String message) {
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      title: title,
      message: message,
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
                    style:
                        TextStyle(color: ColorConstant.green900, fontSize: 35))
              ]),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  onTapLogin();
                },
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Center(
                          child: Container(
                              width: 200,
                              height: 70,
                              /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      color: ColorConstant.green900,
                                      fontSize: 35)),
                              margin: getMargin(left: 80, top: 30))),
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Enter valid username'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: passwordconfirmationController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: 'Confirm password'),
                      ),
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                            hintText: 'Enter valid e-mail'),
                      ),
                    ),
                    Container(
                      margin: getMargin(top: 50),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: ColorConstant.green900,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          if (usernameController.text == "") {
                            show_Simple_Snackbar(context, "Empty username",
                                "Please enter a username.");
                          } else if (passwordController.text == "") {
                            show_Simple_Snackbar(context, "Empty password",
                                "Please enter a password.");
                          } else if (emailController.text == "") {
                            show_Simple_Snackbar(context, "Empty e-mail",
                                "Please enter an e-mail.");
                          } else {
                            MyDatabase.instance
                                .readUsername(usernameController.text)
                                .then((value) {
                              if (value.username != "") {
                                show_Simple_Snackbar(
                                    context,
                                    "Username not valid",
                                    "Sorry! This username is taken!");
                              } else {
                                MyDatabase.instance
                                    .readEmail(emailController.text)
                                    .then((value) {
                                  if (value.username != "") {
                                    show_Simple_Snackbar(
                                        context,
                                        "Email not valid",
                                        "Sorry! There is already an account with this e-mail!");
                                  } else {
                                    if (passwordController.text !=
                                        passwordconfirmationController.text) {
                                      show_Simple_Snackbar(
                                          context,
                                          "Not confirmed password",
                                          "Password and password confirmation are not the same.");
                                    } else {
                                      MyDatabase.instance.isFirstUser().then(
                                        (flag) {
                                          User user;
                                          if (flag) {
                                            user = User(
                                              username: usernameController.text,
                                              password: passwordController.text,
                                              email: emailController.text,
                                              curr: false,
                                              fp: true,
                                            );
                                          } else {
                                            user = User(
                                              username: usernameController.text,
                                              password: passwordController.text,
                                              email: emailController.text,
                                              curr: false,
                                              fp: false,
                                            );
                                          }
                                          MyDatabase.instance.create(user);
                                          log(user.username + " fp is " + user.fp.toString());
                                          show_Simple_Snackbar(
                                              context,
                                              "Account created successfully!",
                                              "Thank you for creating an account, feel free to login now!");
                                          onTapLogin();
                                        },
                                      );
                                    }
                                  }
                                });
                              }
                            });
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        onTapLogin();
                      },
                      child: Text(
                        'Already have an account? Login!',
                        style: TextStyle(
                            color: ColorConstant.green900, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  onTapHomeDefault() {
    Get.toNamed(AppRoutes.homeDefaultScreen);
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}

List<String> usernames = ['george'];
List<String> passwords = ['anastasia'];
List<String> emails = ['georgemystriotis@gmail.com'];
