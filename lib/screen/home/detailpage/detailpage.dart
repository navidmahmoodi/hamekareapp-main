import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/timelinemodel.dart';
import 'package:hamekare_app/controller/darkhast_controller.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:lottie/lottie.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:persian/persian.dart';

class DetailPageModel {
  DetailPageModel({
    required this.adress,
    required this.selectedTime,
    required this.reqname,
    required this.date,
    required this.tozih,
    required this.titleid,
  });

  String adress;
  String reqname;
  TimeLineModel selectedTime;
  String tozih;
  DateTime date;
  int titleid;
}

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.model}) : super(key: key);

  final DetailPageModel model;
  final _controller = Get.put(DarkhastController());

  @override
  Widget build(BuildContext context) {
    // var date = Jalali.now();
    // var now1 = DateFormat.jm().toString();
    DateTime now = DateTime.now();
    DateTime dateOnly = now.getDateOnly();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyThemes.secondryColor,
        automaticallyImplyLeading: false,
        title: Text(
          "تایید نهایی درخواست",
          style: TextStyle(color: MyThemes.primaryColor),
        ),
        actions: [
          IconButton(
              splashColor: MyThemes.primaryColor,
              splashRadius: 22,
              onPressed: (() => Get.back()),
              icon: const Icon(Icons.arrow_forward),
              color: MyThemes.primaryColor),
        ],
      ),
      backgroundColor: MyThemes.secondryColor,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  _controller.postdarkhast(
                      model.selectedTime.time,
                      "${now.hour}:${now.minute}",
                      model.titleid,
                      _controller.mainController.cityid,
                      model.tozih,
                      model.adress,
                      dateOnly);
                  // _controller.postDarkhast.addres = adress;
                  // _controller.postDarkhast.azTaSat = selectedHour;
                  // _controller.postDarkhast.discription = tozih;
                  // _controller.postDarkhast.mobile = phoneNumber;
                  // _controller.postDarkhast.roz =
                  //     getWDbyIndex(date.addDays(roz).weekDay);
                  // _controller.postDarkhast.title = titleid;
                  // _controller.postDarkhast.tarikh =
                  //     date.addDays(tarikh).cDate(7);
                  // await _controller.postdarkhast();
                  if (_controller.postDarkhast.status == false) {
                    // Get.offAllNamed("/home");
                    //  Get.offNamedUntil('/home', (route) => false);
                    Get.back();
                    Get.back();

                    // WidgetsBinding.instance.addPostFrameCallback((_) {
                    //   Get.toNamed(() => const Home());
                    // });

                    ShowMSG().showSnackBar(
                        "سفارش شما با موفقیت ثبت شد, سفارش خود را میتوانید از صفحه سفارشات ببینید");
                    // Get.dialog(
                    // Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(20)),
                    // margin: const EdgeInsets.symmetric(
                    //     vertical: 200, horizontal: 15),
                    // child:
                    // Column(
                    //   children: [
                    // Container(
                    //   child: Lottie.asset(
                    //     "assets/lottie/Tick.json",
                    //   ),
                    // ),
                    // Text(
                    //   "سفارش شما با موفقیت ثبت شد",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: MyThemes.primaryColor, fontSize: 24),
                    // ),
                    // Text(
                    //   "میتوانید سفارش خود را از قسمت سفارشات بررسی کنید",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: MyThemes.primaryColor, fontSize: 16),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 10),
                    //   padding:
                    //       const EdgeInsets.symmetric(horizontal: 15),
                    //   child: ElevatedButton(
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //           MyThemes.secondryColor),
                    //     ),
                    //     onPressed: () {
                    //       Get.back();
                    //     },
                    //     child: Text(
                    //       "رفتن به خانه",
                    //       style:
                    //           TextStyle(color: MyThemes.primaryColor),
                    //     ),
                    //   ),
                    // ),
                    //   ],
                    // ),
                    // ),
                    // barrierColor: Colors.red,
                    // );
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "تایید",
                    style: TextStyle(
                        color: MyThemes.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: MyThemes.primaryColor,
                        width: 2.7,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "انصراف",
                    style: TextStyle(
                        color: MyThemes.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (_controller.postDarkhast.isloading == true) {
          return simpleLoading();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Lottie.asset(
                              "assets/lottie/Request.json",
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                      ],
                    ),
                  ),
                  const Text("روز ثبت درخواست"),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(vertical: 5),
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
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(getWDbyIndex(Jalali.now().weekDay)),
                      ],
                    ),
                  ),
                  const Text("تقاضا"),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(top: 5),
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
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(model.reqname),
                      ],
                    ),
                  ),
                  const Text("ساعت درخواست"),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(top: 5),
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
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(model.selectedTime.time),
                      ],
                    ),
                  ),
                  const Text("روز تقاضای درخواست"),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(top: 5),
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
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(model.date
                            .toJalali()
                            .cDate(7)
                            .withPersianNumbers()),
                      ],
                    ),
                  ),
                  const Text("آدرس"),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(top: 5),
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
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2),
                    ),
                    child: Text(
                      model.adress.toString(),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text("توضیحات"),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(top: 5),
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
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2),
                    ),
                    child: Text(
                      model.tozih.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }
}
