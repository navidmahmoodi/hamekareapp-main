import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/controller/password_controller.dart';
import 'package:hamekare_app/tools/tools.dart';

import 'package:persian/persian.dart';

class SettingScreen extends StatelessWidget {
  final phonecontroller = TextEditingController();
  final otpcontroller = TextEditingController();
  final newPassController = TextEditingController();
  final newPassControllercon = TextEditingController();
  final mailBody = TextEditingController();
  final mailSubject = TextEditingController();
  final MainController controller = Get.find();

  SettingScreen({super.key});
  mail(String suject, String body) async {
    final Email email = Email(
      body: body,
      subject: suject,
      recipients: ['Khane.tvangaranamismehr@gmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  final MainController _mainController = Get.find();
  final _passController = Get.put(PasswordController());

  init() {
    _mainController.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemes.secondryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "تنظیمات",
          style: TextStyle(color: MyThemes.primaryColor),
        ),
      ),
      body: Obx(() {
        if (_mainController.profileResponse.isloading) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: simpleLoading());
        }
        var item = _mainController.profileResponse.data;
        if (item == null) {
          return Center(
            child: Text(_mainController.profileResponse.message),
          );
        }
        return RefreshIndicator(
          backgroundColor: MyThemes.secondryColor,
          color: MyThemes.primaryColor,
          onRefresh: () async {
            init();
          },
          child: ListView(
            padding: const EdgeInsets.only(bottom: 70),
            children: [
              Container(
                width: Get.width,
                // height: 290,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: MyThemes.secondryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 35, bottom: 20),
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: MyThemes.primaryColor, width: 1.5),
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(item.profileImage.toString()),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        item.displayName.toString(),
                        style: const TextStyle(
                          // color: MyThemes.primaryColor,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        item.contactNumber.toString().withPersianNumbers(),
                        style: TextStyle(
                            color: MyThemes.primaryColor, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    side: WidgetStateProperty.all<BorderSide>(
                      BorderSide.merge(
                        BorderSide(width: 2.5, color: MyThemes.secondryColor),
                        BorderSide.merge(
                          BorderSide(width: 0, color: MyThemes.secondryColor),
                          BorderSide(color: MyThemes.secondryColor, width: 0),
                        ),
                      ),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed('/profile');
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.person_outline,
                                color: MyThemes.primaryColor)),
                        Text(
                          "اطلاعات کاربری",
                          style: TextStyle(color: MyThemes.primaryColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: MyThemes.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      side: WidgetStateProperty.all<BorderSide>(
                          BorderSide.merge(
                              BorderSide(
                                  width: 2.5, color: MyThemes.secondryColor),
                              BorderSide.merge(
                                  BorderSide(
                                      width: 0, color: MyThemes.secondryColor),
                                  BorderSide(
                                      color: MyThemes.secondryColor,
                                      width: 0)))),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.add_chart_outlined,
                                color: MyThemes.primaryColor)),
                        Text(
                          "امتیاز دهی",
                          style: TextStyle(color: MyThemes.primaryColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: MyThemes.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      side: WidgetStateProperty.all<BorderSide>(
                          BorderSide.merge(
                              BorderSide(
                                  width: 2.5, color: MyThemes.secondryColor),
                              BorderSide.merge(
                                  BorderSide(
                                      width: 0, color: MyThemes.secondryColor),
                                  BorderSide(
                                      color: MyThemes.secondryColor,
                                      width: 0)))),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Get.dialog(Dialog(
                      backgroundColor: Colors.transparent,
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
                              margin: const EdgeInsets.only(top: 5, bottom: 7),
                              child: Text(
                                "تغییر رمز ورود",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: MyThemes.primaryColor, fontSize: 20),
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 5),
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
                                      color: MyThemes.primaryColor, width: 2),
                                ),
                                child: TextFormField(
                                  controller: phonecontroller,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1000,
                                  style: TextStyle(
                                      color: MyThemes.primaryColor,
                                      fontSize: 18),
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
                                      if (_passController
                                              .passwordResponse.isSuccess ==
                                          true) {
                                        ShowMSG().showSnackBar(
                                            "کد تایید به شماره شما ارسال شد");
                                        Get.dialog(Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 15),
                                            decoration: BoxDecoration(
                                              color: MyThemes.secondryColor,
                                              border: Border.all(
                                                  color: MyThemes.primaryColor,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5, bottom: 7),
                                                  child: Text(
                                                    "تغییر رمز ورود",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: MyThemes
                                                            .primaryColor,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20, bottom: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          spreadRadius: 1,
                                                          offset: const Offset(
                                                              1, 1),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: MyThemes
                                                              .primaryColor,
                                                          width: 2),
                                                    ),
                                                    child: TextFormField(
                                                      controller: otpcontroller,
                                                      maxLines: 1,
                                                      maxLength: 1000,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: TextStyle(
                                                          color: MyThemes
                                                              .primaryColor,
                                                          fontSize: 18),
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                        counterText: "",
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                top: 3),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "کد تایید",
                                                        hintStyle: TextStyle(
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    )),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          spreadRadius: 1,
                                                          offset: const Offset(
                                                              1, 1),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: MyThemes
                                                              .primaryColor,
                                                          width: 2),
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                          newPassController,
                                                      maxLines: 1,
                                                      maxLength: 1000,
                                                      style: TextStyle(
                                                          color: MyThemes
                                                              .primaryColor,
                                                          fontSize: 18),
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                        counterText: "",
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                top: 3),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "رمز جدید",
                                                        hintStyle: TextStyle(
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    )),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          spreadRadius: 1,
                                                          offset: const Offset(
                                                              1, 1),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      border: Border.all(
                                                          color: MyThemes
                                                              .primaryColor,
                                                          width: 2),
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                          newPassControllercon,
                                                      maxLines: 1,
                                                      maxLength: 1000,
                                                      style: TextStyle(
                                                          color: MyThemes
                                                              .primaryColor,
                                                          fontSize: 18),
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                        counterText: "",
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                top: 3),
                                                        border:
                                                            InputBorder.none,
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
                                                          await _passController.changePassConfirm(
                                                              otpcontroller
                                                                  .text,
                                                              phonecontroller
                                                                  .text,
                                                              newPassController
                                                                  .text,
                                                              newPassControllercon
                                                                  .text);
                                                          if (_passController
                                                                  .passwordResponse
                                                                  .isSuccess ==
                                                              true) {
                                                            Get.back();
                                                            Get.back();
                                                            ShowMSG().showSnackBar(
                                                                "رمز عبور شما با موفقیت تغییر کرد.");
                                                          } else {
                                                            ShowMSG().showSnackBar("کد را به درستی وارد کنید.");
                                                          }
                                                          phonecontroller
                                                              .clear();
                                                          otpcontroller.clear();
                                                          newPassController
                                                              .clear();
                                                          newPassControllercon
                                                              .clear();
                                                        },
                                                        style: ButtonStyle(
                                                          shape: WidgetStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color: MyThemes
                                                                    .primaryColor,
                                                                width: 2.7,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              WidgetStateProperty
                                                                  .all(MyThemes
                                                                      .secondryColor),
                                                        ),
                                                        child: Obx(() {
                                                          if (_passController
                                                              .passwordResponse
                                                              .isLoading) {
                                                            return Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        5),
                                                                child:
                                                                    simpleLoading());
                                                          }
                                                          return Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        2),
                                                            child: Text(
                                                              "تایید",
                                                              style: TextStyle(
                                                                  color: MyThemes
                                                                      .primaryColor,
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
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
                                        ShowMSG().showSnackBar(
                                            "شماره شما ثبت نشده است.");
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
                                            margin: const EdgeInsets.symmetric(
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
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.announcement_outlined,
                                color: MyThemes.primaryColor)),
                        Text(
                          "تغییر رمز ورود",
                          style: TextStyle(color: MyThemes.primaryColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: MyThemes.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      side: WidgetStateProperty.all<BorderSide>(
                          BorderSide.merge(
                              BorderSide(
                                  width: 2.5, color: MyThemes.secondryColor),
                              BorderSide.merge(
                                  BorderSide(
                                      width: 0, color: MyThemes.secondryColor),
                                  BorderSide(
                                      color: MyThemes.secondryColor,
                                      width: 0)))),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Get.dialog(Dialog(
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      child: Material(
                        color: Colors.transparent,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: MyThemes.secondryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "ایمیل",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: MyThemes.primaryColor,
                                          fontSize: 23),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              offset: const Offset(1, 1),
                                              blurRadius: 4,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: MyThemes.primaryColor,
                                              width: 2),
                                        ),
                                        child: TextFormField(
                                          controller: mailSubject,
                                          maxLines: 1,
                                          maxLength: 150,
                                          style: TextStyle(
                                              color: MyThemes.primaryColor,
                                              fontSize: 18),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            counterText: "",
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            hintText: "موضوع",
                                            hintStyle: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        )),
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 1,
                                              offset: const Offset(1, 1),
                                              blurRadius: 4,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: MyThemes.primaryColor,
                                              width: 2),
                                        ),
                                        child: TextFormField(
                                          controller: mailBody,
                                          maxLines: 5,
                                          maxLength: 1000,
                                          style: TextStyle(
                                              color: MyThemes.primaryColor,
                                              fontSize: 18),
                                          keyboardType: TextInputType.multiline,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            counterText: "",
                                            contentPadding:
                                                EdgeInsets.only(top: 3),
                                            border: InputBorder.none,
                                            hintText: "توضیحات",
                                            hintStyle: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        )),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    MyThemes.secondryColor),
                                            shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: BorderSide(
                                                color: MyThemes.primaryColor,
                                                width: 2.0,
                                              ),
                                            ))),
                                        onPressed: () {
                                          mail(mailSubject.text, mailBody.text);
                                          Get.back();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Text(
                                            "ارسال",
                                            style: TextStyle(
                                                color: MyThemes.primaryColor,
                                                fontSize: 17),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.mail_outline,
                                color: MyThemes.primaryColor)),
                        Text(
                          "ارتباط با ما",
                          style: TextStyle(color: MyThemes.primaryColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: MyThemes.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Divider(
                  color: MyThemes.primaryColor,
                  height: 1,
                  thickness: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    side: WidgetStateProperty.all<BorderSide>(
                        BorderSide.merge(
                            BorderSide(width: 2.5, color: MyThemes.grey),
                            BorderSide.merge(
                                BorderSide(width: 0, color: MyThemes.grey),
                                BorderSide(color: MyThemes.grey, width: 0)))),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.dialog(Dialog(
                      backgroundColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "خروج از حساب کاربری",
                                    style: TextStyle(
                                        color: MyThemes.primaryColor,
                                        fontSize: 20),
                                  ),
                                ),
                                Divider(
                                    color: MyThemes.primaryColor,
                                    height: 2,
                                    thickness: 1),
                                Container(
                                  // color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _mainController.setToken("");
                                            toMain();
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
                                          child: Container(
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
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
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
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    Colors.white),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: Text(
                                              "انصراف",
                                              style: TextStyle(
                                                  color: MyThemes.primaryColor,
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.door_front_door_outlined,
                                color: MyThemes.primaryColor)),
                        Text(
                          "خروج از حساب کاربری",
                          style: TextStyle(color: MyThemes.primaryColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: MyThemes.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
