import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/city_controller.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/controller/post_city_controller.dart';
import 'package:hamekare_app/screen/Login/law_page.dart';
import 'package:hamekare_app/tools/tools.dart';

class CityScreen extends StatelessWidget {
  CityScreen({Key? key}) : super(key: key);

  final _cityController = Get.put(CityController());
  final _postcityController = Get.put(PostCityController());
  final _mainController = Get.put(MainController());

  init() async {
    await _cityController.getCity();
  }

  init2(int id) async {
    await _cityController.getSubCity(id);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/5.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 40, bottom: 50),
                child: Text(
                  "شهر خود را انتخاب کنید",
                  style: MyThemes.headline1,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  // shrinkWrap: true,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "انتخاب شهر",
                        style: TextStyle(
                            fontSize: 28, color: MyThemes.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Obx(() {
                          if (_postcityController.getcityResponse.isloading) {
                            return simpleLoading();
                          }

                          if (_cityController.getcityModel.isloading) {
                            return simpleLoading();
                          }
                          return ListView.builder(
                            // physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                _cityController.getcityModel.cities!.length,
                            itemBuilder: (c, i) {
                              var item0 =
                                  _cityController.getcityModel.cities![i];
                              return ElevatedButton(
                                onPressed: () {
                                  init2(item0.id);
                                  // top
                                  Get.dialog(
                                    Scaffold(
                                      backgroundColor:
                                          const Color.fromARGB(0, 39, 35, 35),
                                      body: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 70, horizontal: 30),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              child: Text(
                                                "انتخاب شهر",
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    color:
                                                        MyThemes.primaryColor),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Expanded(
                                              child: Obx(() {
                                                if (_cityController
                                                    .getSubcityModel
                                                    .isloading) {
                                                  return simpleLoading();
                                                }
                                                if (_postcityController
                                                    .getcityResponse
                                                    .isloading) {
                                                  return Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 4),
                                                      child: simpleLoading());
                                                }
                                                var item = _cityController
                                                    .getSubcityModel.cities;
                                                if (item == null) {
                                                  return const Center(
                                                    child: Text("یافت نشد"),
                                                  );
                                                }
                                                return ListView.builder(
                                                  // physics: ScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: _cityController
                                                      .getSubcityModel
                                                      .cities!
                                                      .length,
                                                  itemBuilder: (c, i) {
                                                    var item0 = _cityController
                                                        .getSubcityModel
                                                        .cities![i];

                                                    return ElevatedButton(
                                                      onPressed: () async {
                                                        var response =
                                                            await _cityController
                                                                .postCity(item0
                                                                    .id!
                                                                    .toInt());

                                                        // Get.to(LawScreen());
                                                        if (response
                                                                .errorCode ==
                                                            406) {
                                                          ShowMSG().error("خطا",
                                                              "خطای داخلی");
                                                        } else {
                                                          ShowMSG().error("خطا",
                                                              response.message);
                                                        }
                                                        Get.to(LawScreen());

                                                        ShowMSG().showSnackBar(
                                                            "شهر با موفقیت انتخاب شد");
                                                        _mainController
                                                            .setCityid(item0.id!
                                                                .toInt());
                                                        _mainController
                                                            .setCityName(item0
                                                                .name
                                                                .toString());
                                                      },
                                                      style: ButtonStyle(
                                                          shadowColor:
                                                              MaterialStateProperty
                                                                  .all(MyThemes
                                                                      .primaryColor),
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color: MyThemes
                                                                    .primaryColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(MyThemes
                                                                      .secondryColor)),
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 3),
                                                        child: Text(
                                                          item0.name.toString(),
                                                          style: TextStyle(
                                                              color: MyThemes
                                                                  .primaryColor,
                                                              fontSize: 17),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  //end
                                },
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all(
                                        MyThemes.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    item0.name.toString(),
                                    style: TextStyle(
                                        color: MyThemes.primaryColor,
                                        fontSize: 17),
                                  ),
                                ),
                              );

                              // return Container(
                              //   child: Card(
                              //     clipBehavior: Clip.hardEdge,
                              //     shape: RoundedRectangleBorder(
                              //         side: BorderSide(
                              //             color: MyThemes.primaryColor,
                              //             width: 1),
                              //         borderRadius: BorderRadius.circular(15)),
                              //     child: ExpansionTile(
                              //       // onExpansionChanged: (isExpanded) {
                              //       //   _cityController.updateExpanded(
                              //       //       i, isExpanded);
                              //       // },
                              //       // initiallyExpanded: _item.isExpanded,
                              //       textColor: MyThemes.primaryColor,
                              //       childrenPadding: const EdgeInsets.symmetric(
                              //           vertical: 5, horizontal: 5),
                              //       collapsedBackgroundColor:
                              //           MyThemes.secondryColor,
                              //       title: Text(_item.name.toString()),
                              //       backgroundColor: Colors.white,
                              //       iconColor: MyThemes.primaryColor,
                              //       children: [
                              //         Container(
                              //           child: ColumnBuilder(
                              //             itemCount: _item.subcities.length,
                              //             itemBuilder: (c, i) {
                              //               var _item2 = _item.subcities[i];
                              //               return InkWell(
                              //                 onTap: () {},
                              //                 child: Container(
                              //                   margin: const EdgeInsets.only(
                              //                       top: 5, right: 7, left: 7),
                              //                   child: Row(children: [
                              //                     Expanded(
                              //                       child: ClipRRect(
                              //                         clipBehavior:
                              //                             Clip.hardEdge,
                              //                         borderRadius:
                              //                             BorderRadius.all(
                              //                                 Radius.circular(
                              //                                     5)),
                              //                         child: ElevatedButton(
                              //                           clipBehavior:
                              //                               Clip.hardEdge,
                              //                           onPressed: () async {
                              //                             await _postcityController
                              //                                 .postCity(_item2
                              //                                     .iD
                              //                                     .toInt());
                              //                             if (!_postcityController
                              //                                 .getcityResponse
                              //                                 .status) {
                              //                               // _mainController
                              //                               //     .setcity(_item2
                              //                               //         .name);

                              //                               Get.to(VideoScreen());
                              //                             } else {
                              //                               ShowMSG().showSnackBar(
                              //                                   _postcityController
                              //                                       .getcityResponse
                              //                                       .message);
                              //                             }
                              //                           },
                              //                           child: Container(
                              //                             margin:
                              //                                 const EdgeInsets
                              //                                     .only(top: 7),
                              //                             child: Text(
                              //                               _item2.name
                              //                                   .toString()
                              //                                   .withPersianLetters(),
                              //                               style: TextStyle(
                              //                                   color: MyThemes
                              //                                       .primaryColor,
                              //                                   fontSize: 18),
                              //                             ),
                              //                           ),
                              //                           style: ButtonStyle(
                              //                             backgroundColor:
                              //                                 MaterialStateProperty
                              //                                     .all(MyThemes
                              //                                         .secondryColor),
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ]),
                              //                 ),
                              //               );
                              //             },
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            },
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
