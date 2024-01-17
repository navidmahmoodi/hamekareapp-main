import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/darkhast_controller.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:persian/persian.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.adress,
    required this.name,
    required this.phoneNumber,
    required this.reqhour,
    required this.reqname,
    required this.roz,
    required this.tarikh,
    required this.tozih,
    required this.titleid,
  }) : super(key: key);

  final _controller = Get.put(DarkhastController());

  String adress;
  String name;
  String reqname;
  String reqhour;
  String tozih;
  String phoneNumber;
  int roz;
  int titleid;
  int tarikh;
  @override
  Widget build(BuildContext context) {
    var date = Jalali.now();
    var now1 = DateFormat.jm().toString();
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
                  print(now.hour.toString() + ":" + now.minute.toString());
                  print(dateOnly);
                  _controller.postdarkhast(
                      reqhour,
                      "${now.hour.toString() + ":" + now.minute.toString()}",
                      titleid,
                      _controller.mainController.cityid,
                      tozih,
                      adress,
                      dateOnly);
                  // _controller.postDarkhast.addres = adress;
                  // _controller.postDarkhast.azTaSat = reqhour;
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
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
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
                    decoration: BoxDecoration(
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
                  const Text("نام و نام خانوادگی"),
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
                        Text(name.toString()),
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
                        Text(reqname),
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
                        Text(reqhour),
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
                        Text((date).addDays(roz).cDate(7).withPersianNumbers()),
                      ],
                    ),
                  ),
                  const Text("شماره موبایل"),
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
                        Text(phoneNumber.toString().withPersianNumbers()),
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
                      adress.toString(),
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
                      tozih.toString(),
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
    return DateTime(this.year, this.month, this.day);
  }
}
