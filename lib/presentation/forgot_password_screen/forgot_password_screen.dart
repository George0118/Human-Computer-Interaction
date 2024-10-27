import 'package:flutter/material.dart';
import 'package:my_app/core/app_export.dart';
import 'controller/forgot_password_controller.dart';
import 'package:my_app/widgets/app_bar/appbar_stack.dart';
import 'package:my_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:my_app/widgets/app_bar/appbar_title.dart';
import 'package:my_app/widgets/app_bar/custom_app_bar.dart';
import 'package:my_app/widgets/app_bar/appbar_image.dart';
import 'package:my_app/presentation/signin_screen/signin_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:my_app/db/database.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  final TextEditingController emailController = TextEditingController();

  void show_Simple_Snackbar(BuildContext context) {
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 4),
      title: "Oops!",
      message: "There is no user with this e-mail.",
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
          onHorizontalDragEnd: (details) {
            onTapSignUp();
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                    child: Container(
                        width: size.width,
                        height: 100,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text("Forgot your password?",
                              style: TextStyle(
                                  color: ColorConstant.green900, fontSize: 25)),
                          SizedBox(height: 40),
                          Text(
                            "Tell us your e-mail so we can recover it for you!",
                            style: TextStyle(
                                color: ColorConstant.green900, fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                        ]))),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Container(
                margin: getMargin(top: 30),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: ColorConstant.green900,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    MyDatabase.instance
                        .readEmail(emailController.text)
                        .then((value) {
                          if(value.username != "") {
                            onTapLogin();
                          }
                          else {
                            show_Simple_Snackbar(context);
                          }
                    });
                  },
                  child: Text(
                    'Send E-mail',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  onTapLogin();
                },
                child: Text(
                  'Remembered your password? Login!',
                  style: TextStyle(color: ColorConstant.green900, fontSize: 15),
                ),
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

  onTapSignUp() {
    Get.toNamed(AppRoutes.signinScreen);
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
