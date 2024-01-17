import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/get_darkhast_model.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:persian/persian.dart';
import 'package:shamsi_date/shamsi_date.dart';

class CartFullDetail extends StatelessWidget {
  CartFullDetail({Key? key}) : super(key: key);
  final GetDarkhastModel item = Get.arguments;

  Widget _badgeTitle(String value) {
    return Text(
      value,
      textAlign: TextAlign.center,
    );
  }

  Widget _badgeBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.only(
        top: 5,
        right: 5,
        left: 5,
      ),
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
        border: Border.all(color: MyThemes.secondryColor, width: 2),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _rowBox(List<Widget> children) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        margin: const EdgeInsets.only(top: 5, bottom: 2),
        child: ElevatedButton(
          onPressed: () {
            Get.dialog(Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: MyThemes.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        "برآورد هزینه",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyThemes.primaryColor, fontSize: 18),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Divider(
                          color: MyThemes.primaryColor,
                          thickness: 1.8,
                        ),
                        Text("هزینه دستمزد متخصص",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: MyThemes.primaryColor, fontSize: 16)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 130),
                          child: Divider(
                            color: MyThemes.secondryColor,
                            thickness: 1,
                            height: 0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            item.price.toString().withPersianNumbers(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                          color: MyThemes.primaryColor,
                          thickness: 1.8,
                        ),
                        Text("هزینه فاکتور",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: MyThemes.primaryColor, fontSize: 16)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 130),
                          child: Divider(
                            color: MyThemes.secondryColor,
                            thickness: 1,
                            height: 0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            item.price.toString().withPersianNumbers(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          child: ElevatedButton(
                            onPressed: () {
                              // _controller.pay(item.iD);
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: MyThemes.primaryColor,
                                    width: 2.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(MyThemes.green),
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              child: Text(
                                "پرداخت",
                                style: TextStyle(
                                    color: MyThemes.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: MyThemes.primaryColor,
                  width: 2.7,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(MyThemes.green),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "پرداخت",
              style: TextStyle(
                  color: MyThemes.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              splashColor: MyThemes.primaryColor,
              splashRadius: 22,
              onPressed: (() => Get.back()),
              icon: const Icon(Icons.arrow_forward),
              color: MyThemes.primaryColor),
        ],
        backgroundColor: MyThemes.secondryColor,
        title: Text(
          "جزئیات",
          style: TextStyle(color: MyThemes.primaryColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      backgroundColor: MyThemes.secondryColor,
      // bottomNavigationBar: Container(
      //   color: Colors.white,
      //   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Get.back();
      //           },
      //           child: Container(
      //             margin: const EdgeInsets.symmetric(vertical: 2),
      //             child: Text(
      //               "تایید",
      //               style: TextStyle(
      //                   color: MyThemes.primaryColor,
      //                   fontSize: 25,
      //                   fontWeight: FontWeight.normal),
      //             ),
      //           ),
      //           style: ButtonStyle(
      //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                 side: BorderSide(
      //                   color: MyThemes.primaryColor,
      //                   width: 2.7,
      //                 ),
      //                 borderRadius: BorderRadius.circular(50),
      //               ),
      //             ),
      //             backgroundColor:
      //                 MaterialStateProperty.all(MyThemes.secondryColor),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: MyThemes.primaryColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Text("وضعیت درخواست"),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 130),
                        child: Divider(
                          color: MyThemes.secondryColor,
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          item.status.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: MyThemes.primaryColor, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 0, right: 10, left: 10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    offset: const Offset(1, 1),
                                    blurRadius: 4,
                                  ),
                                ],
                                border: Border.all(
                                    color: MyThemes.secondryColor, width: 2),
                              ),
                              clipBehavior: Clip.hardEdge,
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Image.network(
                                "https://galm.ir/images/user/user.png",
                                height: 200,
                                width: 160,
                                // scale: 9,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Text(
                              "item.mUserName",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "item.mTakhasos",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    _rowBox([
                      _badgeTitle("ثبت کننده درخواست"),
                      _badgeBox(item.customerName.toString()),
                      _badgeTitle("روز"),
                      _badgeBox(item.date!.toJalali().cDate(8)),
                      _badgeTitle("تاریخ"),
                      _badgeBox(item.date!.toJalali().cDate(7)),
                    ]),
                    _rowBox([
                      _badgeTitle("کار درخواستی"),
                      _badgeBox(item.serviceName!),
                      _badgeTitle("شماره تماس"),
                      _badgeBox("item.mobile"),
                      _badgeTitle("ساعت"),
                      _badgeBox(item.date!.toJalali().cDate(9)),
                    ]),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        offset: const Offset(1, 1),
                        blurRadius: 4,
                      ),
                    ],
                    border: Border.all(color: MyThemes.primaryColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Text("آدرس"),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 130),
                        child: Divider(
                          color: MyThemes.secondryColor,
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          item.address.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: MyThemes.primaryColor,
                        thickness: 1.8,
                      ),
                      const Text("توضیحات"),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 130),
                        child: Divider(
                          color: MyThemes.secondryColor,
                          thickness: 1,
                          height: 0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          item.description.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
