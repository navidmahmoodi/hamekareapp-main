// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hamekare_app/controller/register_moshtari_controller.dart';
import 'package:hamekare_app/screen/Login/otp.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:persian/persian.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _namController = TextEditingController();
  final _mobileController = TextEditingController();
  final _khanevadegiController = TextEditingController();
  final _adressController = TextEditingController();
  final _emailController = TextEditingController();
  final _workadressController = TextEditingController();
  final _genderController = Get.put(GenderController());
  final _usernameController = Get.put(TextEditingController());
  final _passwordController = TextEditingController();
  final _controller = Get.put(RegisterMoshtariController());
  final GenderController genderController = GenderController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: MyThemes.secondryColor,
        image: const DecorationImage(
          image: AssetImage(
            "assets/image/homebg.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "تکمیل اطلاعات کاربری",
            style: TextStyle(color: MyThemes.primaryColor, fontSize: 22),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.1,
                blurRadius: 4,
              ),
            ]),
            child: ElevatedButton(
              onPressed: () async {
                if (_mobileController.text.length < 11 ||
                    _passwordController.text.length < 8) {
                  ShowMSG().showSnackBar("اطلاعات خود را صحیح وارد کنید !");
                } else if (_emailController.text.isNotEmpty &&
                    !isEmail(_emailController.text)) {
                  ShowMSG().showSnackBar("ایمیل را صحیح وارد کنید.");
                } else {
                  var response = await _controller.postSignUp(
                      _namController.text,
                      _khanevadegiController.text,
                      _emailController.text,
                      _mobileController.text,
                      _passwordController.text,
                      _usernameController.text);

                  ShowMSG()
                      .showSnackBar(_controller.postExpertController.message);

                  if (response.status) {
                    Get.to(() => OtpScreen(phone: _mobileController.text));
                  }
                }
              },
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(MyThemes.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: MyThemes.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(MyThemes.secondryColor)),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  'تایید',
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        body: Obx(() {
          if (_controller.postExpertController.isloading) {
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: simpleLoading(),
              ),
            );
          }
          return ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text.rich(
                  TextSpan(
                      text: "فیلد های دارای ",
                      style: TextStyle(
                        color: MyThemes.primaryColor,
                      ),
                      children: [
                        TextSpan(
                            text: "*", style: TextStyle(color: MyThemes.red)),
                        TextSpan(
                          text: " اجباری می باشد",
                          style: TextStyle(color: MyThemes.primaryColor),
                        )
                      ]),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3, right: 3),
                child: Text.rich(
                  TextSpan(
                    text: "نام",
                    children: [
                      TextSpan(
                          text: " *", style: TextStyle(color: MyThemes.red))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyThemes.primaryColor, width: 1.3),
                ),
                child: TextField(
                  controller: _namController,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: const EdgeInsets.only(right: 5),
                    border: InputBorder.none,
                    hintTextDirection: TextDirection.ltr,
                    hintText: "نام".withPersianNumbers(),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 3, right: 3),
                child: Text.rich(TextSpan(
                  text: "نام خانوادگی",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: MyThemes.red))
                  ],
                )),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.5),
              //         spreadRadius: 1,
              //         offset: const Offset(1, 1),
              //         blurRadius: 4,
              //       ),
              //     ],
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: MyThemes.primaryColor, width: 1.3),
              //   ),
              //   child: TextFormField(
              //     textAlign: TextAlign.left,
              //     controller: _creditController,
              //     textDirection: TextDirection.ltr,
              //     style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
              //     inputFormatters: [
              //       FilteringTextInputFormatter.digitsOnly,
              //       CardNumberFormatter(),
              //     ],
              //     textInputAction: TextInputAction.done,
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       counterText: "",
              //       hintText: "4444 3333 2222 1111".withPersianNumbers(),
              //       contentPadding: EdgeInsets.only(left: 5),
              //       hintStyle: TextStyle(fontSize: 16),
              //     ),
              //     maxLength: 19,
              //     onChanged: (value) {},
              //   ),
              // ),

              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyThemes.primaryColor, width: 1.3),
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: _khanevadegiController,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    hintText: "نام خانوادگی".withPersianNumbers(),
                    contentPadding: const EdgeInsets.only(right: 5),
                    hintStyle: const TextStyle(fontSize: 16),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3, right: 3),
                child: Text.rich(
                  TextSpan(
                    text: "نام کاربری",
                    children: [
                      TextSpan(
                          text: " *", style: TextStyle(color: MyThemes.red))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyThemes.primaryColor, width: 1.3),
                ),
                child: TextField(
                  controller: _usernameController,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: const EdgeInsets.only(right: 5),
                    border: InputBorder.none,
                    hintTextDirection: TextDirection.ltr,
                    hintText: "نام کاربری".withPersianNumbers(),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3, right: 3),
                child: const Text.rich(TextSpan(
                  text: "ایمیل",
                  // children: [
                  //   TextSpan(text: " *", style: TextStyle(color: MyThemes.red))
                  // ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyThemes.primaryColor, width: 1.3),
                ),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  controller: _emailController,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    hintText: "hamekare@gmail.com".withPersianNumbers(),
                    contentPadding: const EdgeInsets.only(left: 5),
                    hintStyle: const TextStyle(fontSize: 16),
                  ),
                  onChanged: (value) {},
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 3, right: 3),
              //   child: Text.rich(TextSpan(
              //     text: "آدرس منزل",
              //     children: [
              //       TextSpan(text: " *", style: TextStyle(color: MyThemes.red))
              //     ],
              //   )),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 7, right: 5, left: 5),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.5),
              //         spreadRadius: 1,
              //         offset: const Offset(1, 1),
              //         blurRadius: 4,
              //       ),
              //     ],
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: MyThemes.primaryColor, width: 1.3),
              //   ),
              //   child: TextFormField(
              //     controller: _adressController,
              //     maxLines: 5,
              //     maxLength: 1000,
              //     style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
              //     keyboardType: TextInputType.multiline,
              //     textAlign: TextAlign.right,
              //     decoration: const InputDecoration(
              //       counterText: "",
              //       contentPadding: EdgeInsets.only(top: 3, right: 5),
              //       border: InputBorder.none,
              //       hintText: "آزادگان ,ساختمان عرفان .....",
              //       hintStyle: TextStyle(
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //     margin: const EdgeInsets.only(right: 3, bottom: 3),
              //     child: Text("آدرس دفتر کار")),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 7, right: 5, left: 5),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.5),
              //         spreadRadius: 1,
              //         offset: const Offset(1, 1),
              //         blurRadius: 4,
              //       ),
              //     ],
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: MyThemes.primaryColor, width: 1.3),
              //   ),
              //   child: TextFormField(
              //     controller: _workadressController,
              //     maxLines: 5,
              //     maxLength: 1000,
              //     style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
              //     keyboardType: TextInputType.multiline,
              //     textAlign: TextAlign.right,
              //     decoration: const InputDecoration(
              //       counterText: "",
              //       contentPadding: EdgeInsets.only(top: 3, right: 5),
              //       border: InputBorder.none,
              //       hintText: "آزادگان ,ساختمان عرفان .....",
              //       hintStyle: TextStyle(
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(bottom: 3, right: 3),
                child: Text.rich(TextSpan(
                  text: "شماره موبایل",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: MyThemes.red))
                  ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyThemes.primaryColor, width: 1.3),
                ),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  controller: _mobileController,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    hintText: "09109998888".withPersianNumbers(),
                    contentPadding: const EdgeInsets.only(left: 5),
                    hintStyle: const TextStyle(fontSize: 16),
                  ),
                  maxLength: 11,
                  onChanged: (value) {},
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 3, right: 3),
                child: Text.rich(TextSpan(
                  text: "رمز ورود",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: MyThemes.red))
                  ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyThemes.primaryColor, width: 1.3),
                ),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  controller: _passwordController,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 17),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    hintText: "رمز ورود".withPersianNumbers(),
                    contentPadding: const EdgeInsets.only(left: 5),
                    hintStyle: const TextStyle(fontSize: 16),
                  ),
                  onChanged: (value) {},
                ),
              ),

              // Obx(() {
              //   return Container(
              //       child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.only(bottom: 3, right: 3),
              //         child: Text.rich(TextSpan(
              //           text: "جنسیت",
              //           children: [
              //             TextSpan(
              //                 text: " *", style: TextStyle(color: MyThemes.red))
              //           ],
              //         )),
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: MyThemes.secondryColor.withOpacity(0.4),
              //         ),
              //         padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              //         child: DropdownButton(
              //           borderRadius: BorderRadius.circular(15),
              //           padding: EdgeInsets.zero,
              //           underline: Container(),
              //           onChanged: (newValue) {
              //             genderController.setSelected(genderController
              //                 .selectedDrowpdown.value = newValue.toString());
              //           },
              //           value: genderController.selectedDrowpdown.value,
              //           items: genderController.list.map((selectedType) {
              //             return DropdownMenuItem(
              //               child: new Text(
              //                 selectedType,
              //               ),
              //               value: selectedType,
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     ],
              //   ));
              // }),
              // Container(
              //     margin: const EdgeInsets.only(right: 3, bottom: 5),
              //     child: Text("عکس کاربری")),
              // Obx(() {
              //   return Row(
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.only(left: 10, right: 5),
              //         child: DottedBorder(
              //           child: InkWell(
              //             onTap: () async {
              //               checkGalleryPermission(context);
              //             },
              //             child: Container(
              //               height: 100,
              //               width: 90,
              //               margin: const EdgeInsets.symmetric(
              //                   vertical: 1, horizontal: 1),
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(20)),
              //               child: Center(
              //                 child: Icon(
              //                   Icons.add_a_photo_rounded,
              //                   size: 30,
              //                   color: MyThemes.secondryColor,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           borderType: BorderType.RRect,
              //           radius: Radius.circular(20),
              //           dashPattern: [8.5, 8.5],
              //           color: MyThemes.secondryColor,
              //           strokeWidth: 2,
              //         ),
              //       ),
              //       Container(
              //         child: DottedBorder(
              //           child: Container(
              //             height: 100,
              //             width: 90,
              //             margin: const EdgeInsets.symmetric(
              //                 vertical: 1, horizontal: 1),
              //             decoration: BoxDecoration(
              //                 color: MyThemes.settingGrey,
              //                 image: DecorationImage(
              //                     fit: BoxFit.fill,
              //                     image: _imageController.selectedImage),
              //                 borderRadius: BorderRadius.circular(20)),
              //           ),
              //           borderType: BorderType.RRect,
              //           radius: Radius.circular(20),
              //           dashPattern: [8.5, 8.5],
              //           color: MyThemes.secondryColor,
              //           strokeWidth: 2,
              //         ),
              //       ),
              //     ],
              //   );
              // }),
              // city_body(),
              // expert_body(),
              // SizedBox(height: 10),
            ],
          );
        }),
      ),
    ));
  }
}

class GenderController extends GetxController {
  var selectedDrowpdown = 'آقا'.obs;
  List list = ['آقا', 'خانم'];

  void setSelected(String value) {
    selectedDrowpdown.value = value;
  }
}
