import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/screen/Login/city.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:persian/persian.dart';

import '../../controller/login_contoller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({
    Key? key,
    required this.phone,
    this.errorController,
  }) : super(key: key);
  final String phone;
  final LoginController _controller = Get.find();
  final MainController _mainController = Get.find();

  final TextEditingController textEditingController = TextEditingController();

  final StreamController<ErrorAnimationType>? errorController;
  final _loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  void init() {
    _controller.startTimer();
    _mainController.api.reqOtp();
  }

  // void init() async {
  //   final _loginController = Get.put(LoginController());
  //   await _loginController.postLogin();
  //   var _dio = Dio();
  //   _dio.post("https://hamakareh.ir/api/loginPhone",
  //       data: {"phone": widget.phoneNumber});
  //   if (!_loginController.loginResponse.isError) {
  //     Get.toNamed(() => const CityScreen());
  //   } else {
  //     ShowMSG().info("رمز یکبار مصرف را درست وارد کنید", "هشدار");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    init();
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/5.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
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
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset(imagePath("iconotp.png")),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 7,
                    ),
                    child: Text("لطفا کد چهار رقمی را وارد کنید",
                        style: MyThemes.bodyText2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15, left: 7),
                        child: Text("کد چهار رقمی به",
                            style: TextStyle(
                                color: MyThemes.primaryColor, fontSize: 18)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 11),
                        child: Text(
                          phone.withPersianNumbers(),
                          style: TextStyle(
                            color: MyThemes.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        length: 5,
                        animationType: AnimationType.scale,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 45,
                          fieldWidth: 35,
                          disabledColor: MyThemes.secondryColor,
                          inactiveColor: MyThemes.primaryColor,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          activeColor: MyThemes.secondryColor,
                          errorBorderColor: Colors.red,
                          selectedColor: MyThemes.primaryColor,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: MyThemes.secondryColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            color: MyThemes.primaryColor,
                            blurRadius: 10,
                          )
                        ],
                        onChanged: (value) {
                          // currentText = value;
                        },
                      ),
                    ),
                  ),
                  Obx(() {
                    if (_controller.levelClock == 0) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 3),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _controller.dispose();
                                    textEditingController.dispose();
                                    Get.back();
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: MyThemes.primaryColor,
                                          width: 2.7,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    backgroundColor: WidgetStateProperty.all(
                                        MyThemes.secondryColor),
                                  ),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: FittedBox(
                                      child: Text(
                                        "تغییر اطلاعات",
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: MyThemes.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 3),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    var response =
                                        await _mainController.api.reqOtp();
                                    if (response.status == true) {
                                      ShowMSG().showSnackBar(
                                          "پیامک به شماره شما ارسال شد.");
                                    } else {
                                      ShowMSG().showSnackBar(
                                          "پیامک قبلا به شماره شما ارسال شده است.");
                                    }
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: MyThemes.primaryColor,
                                          width: 2.7,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    backgroundColor: WidgetStateProperty.all(
                                        MyThemes.secondryColor),
                                  ),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Obx(() {
                                      if (_loginController.isloading) {
                                        return Container(
                                            child: simpleLoading());
                                      }
                                      return FittedBox(
                                        child: Text(
                                          "ارسال کد",
                                          style: TextStyle(
                                            color: MyThemes.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: MyThemes.primaryColor,
                                        width: 2.7,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      MyThemes.secondryColor),
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    "تغییر اطلاعات",
                                    style: TextStyle(
                                      color: MyThemes.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const Spacer(),
                          Text(
                            "دوباره امتحان کن ",
                            style: MyThemes.bodyText3,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                                '${(Duration(seconds: _controller.levelClock))}'
                                    .toString()
                                    .withPersianNumbers()
                                    .substring(2, 7)),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (textEditingController.text.length == 5) {
                        var response = await _loginController.postOtp(
                            textEditingController.text, phone);
                        _controller.otpResponse.isSuccess == true;
                        // print(response.isSuccess);
                        if (response.isSuccess == true) {
                          Get.to(CityScreen());
                        } else if (response.errorCode == 406) {
                          ShowMSG().error("خطا", "کد یکبار مصرف صحیح نمی باشد");
                        } else {
                          ShowMSG().error("خطا", response.message);
                        }
                      } else {
                        ShowMSG().error("خطا", "کد یکبار باید 5 عدد باشد");
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
                      if (_loginController.isloading) {
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
                            fontWeight: FontWeight.normal,
                          ),
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
