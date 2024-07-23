// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/get_darkhast_model.dart';
import 'package:hamekare_app/controller/darkhast_controller.dart';

import '../../controller/rate_req_controller.dart';
import '../../tools/tools.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final _controller = Get.put(DarkhastController());
  final _rateReqController = Get.put(RateReqController());
  final _nazarController = TextEditingController();

  init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.getDarkhsat();
    });
  }

  void toDetailPage(GetDarkhastModel item) {
    toPage("/cartFullDetail", argument: item);
  }

  Widget _itemBox(GetDarkhastModel item, List<Handyman> handymanItem) {
    var handyManitem = handymanItem;
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyThemes.primaryColor, width: 1.5),
      ),
      child: InkWell(
        onTap: () {
          toDetailPage(item);
        },
        borderRadius: BorderRadius.circular(20),
        splashColor: MyThemes.secondryColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: item.status == "cancelled" || item.status == "rejected"
                    ? MyThemes.red.withOpacity(0.7)
                    : MyThemes.secondryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.statusLabel.toString(),
                      style: TextStyle(
                          color: MyThemes.primaryColor, fontSize: 16.5)),
                ],
              ),
            ),
            Divider(color: MyThemes.primaryColor, thickness: 1, height: 0),
            Container(
              color: item.status == "cancelled" || item.status == "rejected"
                  ? MyThemes.red.withOpacity(0.8)
                  : Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: MyThemes.settingGrey,
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              item.serviceName.toString(),
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: MyThemes.primaryColor,
                                  fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "ثبت کننده درخواست: ",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: MyThemes.primaryColor,
                                  fontSize: 12.5,
                                ),
                              ),
                              Text(
                                item.customerName.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: MyThemes.primaryColor,
                                    fontSize: 11.5),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("آدرس: ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: MyThemes.primaryColor,
                                      fontSize: 12.5)),
                              Flexible(
                                child: Text(item.address.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: MyThemes.primaryColor,
                                        fontSize: 11.5)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("توضیحات: ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: MyThemes.primaryColor,
                                      fontSize: 12.5)),
                              Flexible(
                                child: Text(
                                  item.description.toString(),
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: MyThemes.primaryColor,
                                      fontSize: 11.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(left: 30),
                        width: 1,
                        height: 189,
                        color: MyThemes.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 135,
                      height: 200,
                      child: item.handyman == []
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                          color: MyThemes.secondryColor,
                                          width: 2),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, top: 22),
                                    child: Image.network(
                                      "https://galm.ir/images/user/user.png",
                                      height: 120,
                                      width: 100,
                                    )),
                                const Text(
                                  "بدون متخصص",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "بدون شماره تماس",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12.5),
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemCount: handyManitem.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (c, i) {
                                var handy = handyManitem[i];
                                return Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      child: Image.network(
                                        handy.profileImage.toString(),
                                        height: 120,
                                        width: 100,
                                        // scale: 9,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      handy.displayname.toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      handy.contactNumber.toString(),
                                      style: const TextStyle(fontSize: 12.5),
                                    ),
                                  ],
                                );
                              }))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: MyThemes.brown3,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
              ),
              child: Column(
                children: [
                  Divider(
                    height: 0,
                    thickness: 1,
                    color: MyThemes.primaryColor,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 2.5),
                            child: ElevatedButton(
                              onPressed: () {
                                toDetailPage(item);
                              },
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      MyThemes.secondryColor)),
                              child: Text(
                                "جزئیات",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    color: MyThemes.primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 2.5),
                            child: ElevatedButton(
                              onPressed: item.status == "cancelled" ||
                                      item.status == "rejected"
                                  ? () {}
                                  : () => _setRating(item),
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: item.status == "cancelled" ||
                                          item.status == "rejected"
                                      ? WidgetStateProperty.all(
                                          MyThemes.red.withOpacity(0.45))
                                      : WidgetStateProperty.all(
                                          MyThemes.secondryColor)),
                              child: FittedBox(
                                child: Text(
                                  "امتیاز دهی",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: MyThemes.primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 2.5),
                            child: ElevatedButton(
                              onPressed: item.status == "cancelled" ||
                                      item.status == "rejected" || item.status == "waiting"
                                  ? () {}
                                  : () {
                                      _cancelRequest(item.id!.toInt());
                                      // print(item.id);
                                    },
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  backgroundColor: item.status == "cancelled" ||
                                          item.status == "rejected"
                                      ? WidgetStateProperty.all(
                                          MyThemes.red.withOpacity(0.45))
                                      : WidgetStateProperty.all(
                                          MyThemes.red)),
                              child: Text(
                                "انصراف",
                                style: TextStyle(
                                    fontSize: 14, color: MyThemes.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyThemes.secondryColor,
        centerTitle: true,
        title: Text(
          "سفارشات",
          style: TextStyle(color: MyThemes.primaryColor),
        ),
      ),
      // backgroundColor: Colors.redAccent,
      body: Obx(() {
        if (_controller.getDarkhast.data == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(imagePath("nodata.png"), scale: 2),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Text(
                    "شما درخواستی ثبت نکرده اید.",
                    style:
                        TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        }
        // if (_controller.getDarkhast.isloading) {
        //   return Container(
        //       margin: const EdgeInsets.symmetric(vertical: 5),
        //       child: simpleLoading());
        // }
        // if (_cancleController.cancleReqController.isloading) {
        //   return Container(
        //       margin: const EdgeInsets.symmetric(vertical: 5),
        //       child: simpleLoading());
        // }
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: RefreshIndicator(
            backgroundColor: MyThemes.secondryColor,
            color: MyThemes.primaryColor,
            onRefresh: () async {
              init();
            },
            child: ListView.builder(
                itemCount: _controller.getDarkhast.data!.length,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (c, i) {
                  var item = _controller.getDarkhast.data![i];
                  var handyManItem = item.handyman;
                  return _itemBox(item, handyManItem!.toList());
                }),
          ),
        );
      }),
    );
  }

  void _cancelRequest(int id) async {
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "آیا از درخواست خود انصراف می دهید ؟",
                    maxLines: 1,
                    style:
                        TextStyle(color: MyThemes.primaryColor, fontSize: 20),
                  ),
                ),
                Divider(color: MyThemes.primaryColor, height: 2, thickness: 1),
                Container(
                  // color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await _controller.updateDarkhsat(id, "cancelled");
                            Get.back();
                            init();
                            ShowMSG().showSnackBar(
                                _controller.updateResponse.message);
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
                            backgroundColor:
                                WidgetStateProperty.all(MyThemes.red),
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
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              "برگشت",
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
              ],
            ),
          ),
        ],
      ),
    ));
  }

  _setRating(GetDarkhastModel item) {
    var rating1 = 0;
    Get.dialog(
      Dialog(
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
                  "امتیاز دهی",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyThemes.primaryColor, fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                decoration: BoxDecoration(
                  color: Colors.amber.shade800,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: MyThemes.primaryColor, width: 2),
                ),
                child: RatingBar.builder(
                    minRating: 1,
                    maxRating: 5,
                    tapOnlyMode: true,
                    textDirection: TextDirection.ltr,
                    itemCount: 5,
                    itemSize: 40,
                    glow: true,
                    glowRadius: 100,
                    glowColor: MyThemes.secondryColor,
                    itemBuilder: ((context, index) => Icon(
                        Icons.star_rate_sharp,
                        color: MyThemes.secondryColor)),
                    onRatingUpdate: (rating) {
                      rating1 = rating.toInt();
                    }),
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
                    controller: _nazarController,
                    maxLines: 5,
                    maxLength: 1000,
                    style:
                        TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.only(top: 3),
                      border: InputBorder.none,
                      hintText: "نظر و انتقاد شما",
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
                        var response = await _rateReqController.rateReqApp({
                          "id": item.id!,
                          "review": _nazarController.text,
                          "rating": rating1,
                          "booking_id": item.id,
                          "service_id": item.serviceId,
                          "customer_id": item.customerId,
                        });
                        if (response.status == true) {
                          Get.back();
                          ShowMSG().showSnackBar("نظر شما با موفقیت ثبت شد.");
                        } else {
                          Get.back();
                          ShowMSG().showSnackBar("لطفا دقایقی دیگر تلاش کنید");
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
                        if (_rateReqController.rateReqController.isloading) {
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
      ),
    );
  }
}
