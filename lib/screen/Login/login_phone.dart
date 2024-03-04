import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/login_contoller.dart';
import 'package:hamekare_app/screen/Login/information_screen.dart';

import '../../tools/tools.dart';

class LoginScreen extends StatelessWidget {
  final _controller = TextEditingController();
  final _loginController = Get.put(LoginController());
  final _mobilecontroller = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/5.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "برای ورود",
                    style: MyThemes.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "شماره موبایل و رمز ورود خود را وارد کنید",
                      style: MyThemes.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  "تمام حقوق اپلیکیشن همه‌کاره متعلق به خانه توانگر آنامیس مهر می باشد",
                  style: MyThemes.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 330,
                padding: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text(
                        "ورود",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: _mobilecontroller,
                        style: TextStyle(
                            color: MyThemes.primaryColor, fontSize: 17),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 11,
                        decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(top: 2),
                            border: InputBorder.none,
                            hintText: "موبایل",
                            hintStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(
                            color: MyThemes.primaryColor, fontSize: 17),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(top: 2),
                            border: InputBorder.none,
                            hintText: "رمز عبور",
                            hintStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_mobilecontroller.text.length == 11) {
                            var response = await _loginController.postLogin(
                                _controller.text, _mobilecontroller.text);
                            if (response.status) {
                              toMain();

                              // ShowMSG().showSnackBar(
                              //     _loginController.loginResponse.message);
                            } else if (response.errorCode == 406) {
                              ShowMSG().error("خطا",
                                  "نام کاربری یا رمز عبور صحیح نمی باشد");
                            } else {
                              ShowMSG().error("خطا", response.message);
                            }
                          } else {
                            ShowMSG().showSnackBar(
                                _loginController.loginResponse.message);
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                color: MyThemes.primaryColor,
                                width: 2.7,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(MyThemes.secondryColor),
                        ),
                        child: Obx(() {
                          if (_loginController.loginResponse.isloading) {
                            return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: simpleLoading());
                          }
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              "تایید",
                              style: TextStyle(
                                  color: MyThemes.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: Get.width / 2,
                      child: TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {
                            Get.to(RegisterScreen());
                          },
                          child: Text(
                            "حساب کاربری ندارید؟ ثبت نام کنید",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyThemes.primaryColor,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
