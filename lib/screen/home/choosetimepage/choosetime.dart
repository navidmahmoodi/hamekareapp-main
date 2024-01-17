// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:hamekare_app/Widgets/dayline.dart';
import 'package:hamekare_app/Widgets/timeline.dart';
import 'package:hamekare_app/controller/reserve_controller.dart';
import 'package:hamekare_app/screen/home/detailpage/detailpage.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:hamekare_app/tools/tools.dart';

class ChooseTime extends StatelessWidget {
  ChooseTime({
    Key? key,
    required this.id,required this.reqName
  }) : super(key: key);
  int id;
  String reqName;

  int currentday = Jalali.now().weekDay;
  int monthday = Jalali.now().day;
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _tozihController = TextEditingController();
  final _adressController = TextEditingController();

  final dayController = Get.put(ReserveController());
  final dayController2 = Get.put(ReserveController());

  Color _colorContainer = Colors.white;

  final _controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_adressController.text.length == 0 ||
                        _mobileController.text.length <= 10 ||
                        _nameController.text.length == 0) {
                      ShowMSG().showSnackBar("اطلاعات خود را درست وارد کنید");
                    } else {
                      Get.to(() => DetailPage(
                          adress: _adressController.text,
                          name: _nameController.text,
                          phoneNumber: _mobileController.text,
                          reqhour: dayController.selectedTime,
                          reqname: reqName,
                          roz: dayController.day,
                          tarikh: monthday,
                          tozih: _tozihController.text,
                          titleid: id));
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
            ],
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            ExpandablePanel(
              expanded: Container(
                width: size.width,
                height: 215,
                decoration: BoxDecoration(
                  color: MyThemes.secondryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    DayLine(),
                    TimeLine(),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_controller.expanded) {
                                _controller.expanded = false;
                                _colorContainer = Colors.white;
                              } else {
                                _controller.expanded = true;
                                _colorContainer = MyThemes.secondryColor;
                              }
                            },
                            child: Text(
                              "تایید",
                              style: TextStyle(color: MyThemes.primaryColor),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              collapsed: Container(),
              header: Container(
                color: _colorContainer,
                child: Container(
                  height: 215,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: MyThemes.brown3,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Text(id.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 25, top: 10),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              splashRadius: 20,
                              splashColor: MyThemes.red,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: MyThemes.secondryColor,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              reqName,
                              softWrap: false,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: MyThemes.secondryColor, fontSize: 17),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "زمان مراجعه متخصص به مکان شما",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                MyThemes.secondryColor),
                          ),
                          onPressed: () {
                            if (_controller.expanded) {
                              _controller.expanded = false;
                              _colorContainer = Colors.white;
                            } else {
                              _controller.expanded = true;
                              _colorContainer = MyThemes.secondryColor;
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "انتخاب زمان",
                                style: TextStyle(color: MyThemes.primaryColor),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 2, bottom: 2, right: 20),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: MyThemes.primaryColor,
                                  size: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              controller: _controller,
              theme: const ExpandableThemeData(
                hasIcon: false,
                tapHeaderToExpand: false,
                tapBodyToExpand: false,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Text(
                      "سفارش",
                      style: TextStyle(
                        color: MyThemes.primaryColor,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
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
                    child: TextField(
                      controller: _nameController,
                      style:
                          TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      // readOnly: true,
                      decoration: const InputDecoration(
                        counterText: "",
                        contentPadding: EdgeInsets.only(top: 0),
                        border: InputBorder.none,
                        hintText: "نام و نام خانوادگی",
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                    child: TextField(
                      controller: _mobileController,
                      maxLength: 11,
                      style:
                          TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        counterText: "",
                        contentPadding: EdgeInsets.only(top: 0),
                        border: InputBorder.none,
                        hintText: "شماره موبایل",
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                    child: TextFormField(
                      controller: _adressController,
                      maxLines: 5,
                      maxLength: 1000,
                      style:
                          TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                      keyboardType: TextInputType.multiline,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(new RegExp(r"\n"))
                      ],
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        counterText: "",
                        contentPadding: EdgeInsets.only(top: 3),
                        border: InputBorder.none,
                        hintText: "آدرس",
                        hintStyle: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                    child: TextFormField(
                      controller: _tozihController,
                      maxLines: 5,
                      maxLength: 1000,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(new RegExp(r"\n"))
                      ],
                      style:
                          TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        counterText: "",
                        contentPadding: EdgeInsets.only(top: 3),
                        border: InputBorder.none,
                        hintText: "توضیحات",
                        hintStyle: TextStyle(
                          fontSize: 17,
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
    );
  }
}
