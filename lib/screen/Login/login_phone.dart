import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/login_contoller.dart';
import 'package:hamekare_app/controller/password_controller.dart';
import 'package:hamekare_app/screen/Login/information_screen.dart';
import 'package:hamekare_app/screen/home.dart';

import '../../tools/tools.dart';

class LoginScreen extends StatelessWidget {
  final phonecontroller = TextEditingController();
  final otpcontroller = TextEditingController();
  final newPassController = TextEditingController();
  final newPassControllercon = TextEditingController();
  final _controller = TextEditingController();
  final _loginController = Get.put(LoginController());
  final _mobilecontroller = TextEditingController();
  final _passController = Get.put(PasswordController());

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
                height: 374,
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
                            if (response.status == true) {
                              // print(response.status);
                              Get.to(() => const HomeScreen());

                              // ShowMSG().showSnackBar(response.message);
                            } else {
                              // print("no");
                              ShowMSG()
                                  .showSnackBar("اطلاعات شما صحیح نمی باشد.");
                            }
                          } else {
                            ShowMSG().showSnackBar(
                                "شماره موبایل خود را تصحیح وارد کنید.");
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                color: MyThemes.primaryColor,
                                width: 2.7,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all(MyThemes.secondryColor),
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
                      height: 34,
                      width: Get.width / 2,
                      child: TextButton(
                          style: ButtonStyle(
                              padding:
                                  WidgetStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {
                            Get.dialog(forgetPass());
                          },
                          child: Text(
                            "فراموشی رمز عبور",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyThemes.primaryColor,
                            ),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(RegisterScreen());
                        },
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: WidgetStatePropertyAll(
                                MyThemes.secondryColor)),
                        child: Text(
                          "حساب کاربری ندارید؟ ثبت نام کنید",
                          style: TextStyle(color: MyThemes.primaryColor),
                        ),
                      ),
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

  Widget forgetPass() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: MyThemes.secondryColor,
          border: Border.all(color: MyThemes.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 7),
              child: Text(
                "فراموشی رمز عبور",
                textAlign: TextAlign.center,
                style: TextStyle(color: MyThemes.primaryColor, fontSize: 20),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      offset: const Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyThemes.primaryColor, width: 2),
                ),
                child: TextFormField(
                  controller: phonecontroller,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  maxLength: 1000,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.only(top: 3),
                    border: InputBorder.none,
                    hintText: "شماره موبایل",
                    hintStyle: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // var reponse = 
                      await _passController.changePassReq(
                        phonecontroller.text,
                      );
                      if (_passController.passwordResponse.isSuccess == true) {
                        ShowMSG()
                            .showSnackBar("کد تایید به شماره شما ارسال شد");
                        Get.dialog(Dialog(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: MyThemes.secondryColor,
                              border: Border.all(
                                  color: MyThemes.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 7),
                                  child: Text(
                                    "فراموشی رمز عبور",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: MyThemes.primaryColor,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 1,
                                          offset: const Offset(1, 1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: MyThemes.primaryColor,
                                          width: 2),
                                    ),
                                    child: TextFormField(
                                      controller: otpcontroller,
                                      maxLines: 1,
                                      maxLength: 1000,
                                      style: TextStyle(
                                          color: MyThemes.primaryColor,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(top: 3),
                                        border: InputBorder.none,
                                        hintText: "کد تایید",
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 1,
                                          offset: const Offset(1, 1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: MyThemes.primaryColor,
                                          width: 2),
                                    ),
                                    child: TextFormField(
                                      controller: newPassController,
                                      maxLines: 1,
                                      maxLength: 1000,
                                      style: TextStyle(
                                          color: MyThemes.primaryColor,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(top: 3),
                                        border: InputBorder.none,
                                        hintText: "رمز جدید",
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 1,
                                          offset: const Offset(1, 1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: MyThemes.primaryColor,
                                          width: 2),
                                    ),
                                    child: TextFormField(
                                      controller: newPassControllercon,
                                      maxLines: 1,
                                      maxLength: 1000,
                                      style: TextStyle(
                                          color: MyThemes.primaryColor,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(top: 3),
                                        border: InputBorder.none,
                                        hintText: "تایید رمز",
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    )),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await _passController
                                              .changePassConfirm(
                                                  otpcontroller.text,
                                                  phonecontroller.text,
                                                  newPassController.text,
                                                  newPassControllercon.text);
                                          if (_passController
                                                  .passwordResponse.isSuccess ==
                                              true) {
                                            Get.back();
                                            Get.back();
                                            ShowMSG().showSnackBar(
                                                "رمز عبور شما با موفقیت تغییر کرد.");
                                          } else {
                                            ShowMSG().showSnackBar(
                                                "کد تایید شما اشتباه می باشد.");
                                          }
                                          phonecontroller.clear();
                                          otpcontroller.clear();
                                          newPassController.clear();
                                          newPassControllercon.clear();
                                        },
                                        style: ButtonStyle(
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: MyThemes.primaryColor,
                                                width: 2.7,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  MyThemes.secondryColor),
                                        ),
                                        child: Obx(() {
                                          if (_passController
                                              .passwordResponse.isLoading) {
                                            return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: simpleLoading());
                                          }
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: Text(
                                              "تایید",
                                              style: TextStyle(
                                                  color: MyThemes.primaryColor,
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                      } else {
                        ShowMSG().showSnackBar("شماره شما ثبت نشده است.");
                      }
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: MyThemes.primaryColor,
                            width: 2.7,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all(MyThemes.secondryColor),
                    ),
                    child: Obx(() {
                      if (_passController.passwordResponse.isLoading) {
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
