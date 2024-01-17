import 'package:flutter/material.dart';
import 'package:hamekare_app/screen/Login/video_screen.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:get/get.dart';

class LawScreen extends StatelessWidget {
  LawScreen({Key? key}) : super(key: key);
  // final _ghavaninController = Get.put(GhavaninController());
  final acceptt = Get.put(Navid2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "تایید قوانین",
                  style: TextStyle(fontSize: 28, color: MyThemes.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Text("آیا قوانین را قبول دارید ؟"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: MyThemes.secondryColor,
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 3),
                      child: Obx(() {
                        return Checkbox(
                            checkColor: MyThemes.secondryColor,
                            fillColor: MaterialStateProperty.all(
                                MyThemes.primaryColor),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(50)),
                            value: acceptt.v.value,
                            onChanged: (n) {
                              acceptt.change(n!);
                            });
                      }),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (acceptt.v.value == false) {
                          ShowMSG().showSnackBar("لطفا قوانین را قبول کنید.");
                        } else {
                          Get.to(VideoScreen());
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          'تایید',
                          style: TextStyle(
                              color: MyThemes.primaryColor, fontSize: 20),
                        ),
                      ),
                      style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all(MyThemes.primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                color: MyThemes.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              MyThemes.secondryColor)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class Navid2 extends GetxController {
  var _responseObs = Accept().obs;
  Accept get response => _responseObs.value;

  RxBool v = false.obs;
  void change(bool i) => i ? v.value = true : v.value = false;
}

class Accept {
  Accept({this.acc});
  bool? acc = false;
}
