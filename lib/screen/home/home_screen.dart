import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Widgets/homegridview.dart';
import 'package:hamekare_app/Widgets/mainpageslider.dart';
import 'package:hamekare_app/controller/city_controller.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/controller/main_slider_controller.dart';
import 'package:hamekare_app/controller/post_city_controller.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:persian/persian.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SliderController());
  final MainController _mainController = Get.find();
  init() async {
    await _cityController.getCity();
  }

  init3() async {
    if (_controller.sliderResponse.data!.isEmpty) {
      await _mainController.getCategory();
    }
  }

  init4() {
    _controller.getSlider();
  }

  init5(int id) {
    _cityController.getSubCity(id);
  }

  final _cityController = Get.put(CityController());
  final _postcityController = Get.put(PostCityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/homebg.png"),
            // colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
            // opacity: 0.05,
            fit: BoxFit.fill,
          ),
        ),
        child: RefreshIndicator(
          backgroundColor: MyThemes.secondryColor,
          color: MyThemes.primaryColor,
          onRefresh: () async {
            await init3();
            await init4();
          },
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        "به چه خدماتی نیاز دارید؟",
                        style: TextStyle(
                            fontSize: 20, color: MyThemes.primaryColor),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyThemes.brown),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          init();
                          Get.dialog(
                            Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 70, horizontal: 30),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Text(
                                        "انتخاب شهر",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: MyThemes.primaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Obx(() {
                                        if (_cityController
                                            .getcityModel.isloading) {
                                          return simpleLoading();
                                        }
                                        if (_postcityController
                                            .getcityResponse.isloading) {
                                          return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: simpleLoading());
                                        }
                                        var item =
                                            _cityController.getcityModel.cities;
                                        if (item == null) {
                                          return Center(
                                            child: Text("یافت نشد"),
                                          );
                                        }
                                        return ListView.builder(
                                          // physics: ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: _cityController
                                              .getcityModel.cities!.length,
                                          itemBuilder: (c, i) {
                                            var _item = _cityController
                                                .getcityModel.cities![i];

                                            return ElevatedButton(
                                              onPressed: () {
                                                init5(_item.id);
                                                print(_item.id);
                                                // top
                                                Get.dialog(
                                                  Scaffold(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    body: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 20,
                                                          horizontal: 20),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 70,
                                                          horizontal: 30),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        15),
                                                            child: Text(
                                                              "انتخاب شهر",
                                                              style: TextStyle(
                                                                  fontSize: 28,
                                                                  color: MyThemes
                                                                      .primaryColor),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                        vertical:
                                                                            4),
                                                                    child:
                                                                        simpleLoading());
                                                              }
                                                              var item =
                                                                  _cityController
                                                                      .getSubcityModel
                                                                      .cities;
                                                              if (item ==
                                                                  null) {
                                                                return Center(
                                                                  child: Text(
                                                                      "یافت نشد"),
                                                                );
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                // physics: ScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    _cityController
                                                                        .getSubcityModel
                                                                        .cities!
                                                                        .length,
                                                                itemBuilder:
                                                                    (c, i) {
                                                                  var _item = _cityController
                                                                      .getSubcityModel
                                                                      .cities![i];

                                                                  return ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      _mainController.setCityid(_item
                                                                          .id!
                                                                          .toInt());
                                                                      print(_mainController
                                                                          .cityid);
                                                                      _mainController.setCityName(_item
                                                                          .name
                                                                          .toString());
                                                                      Get.back();
                                                                      Get.back();
                                                                      _mainController
                                                                          .init();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      margin: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        _item
                                                                            .name
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                MyThemes.primaryColor,
                                                                            fontSize: 17),
                                                                      ),
                                                                    ),
                                                                    style: ButtonStyle(
                                                                        shadowColor: MaterialStateProperty.all(MyThemes.primaryColor),
                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                            side:
                                                                                BorderSide(
                                                                              color: MyThemes.primaryColor,
                                                                              width: 2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                        ),
                                                                        backgroundColor: MaterialStateProperty.all(MyThemes.secondryColor)),
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
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3),
                                                child: Text(
                                                  _item.name.toString(),
                                                  style: TextStyle(
                                                      color:
                                                          MyThemes.primaryColor,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                  shadowColor:
                                                      MaterialStateProperty.all(
                                                          MyThemes
                                                              .primaryColor),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        color: MyThemes
                                                            .primaryColor,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          MyThemes
                                                              .secondryColor)),
                                            );

                                            // return Container(
                                            //   child: Card(
                                            //     clipBehavior: Clip.hardEdge,
                                            //     shape: RoundedRectangleBorder(
                                            //         side: BorderSide(
                                            //             color: MyThemes
                                            //                 .primaryColor,
                                            //             width: 1),
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 15)),
                                            //     child: ExpansionTile(
                                            //       // onExpansionChanged: (isexpanded) {
                                            //       //   if (isexpanded == true) {
                                            //       //     color == true;
                                            //       //   }
                                            //       // },
                                            //       textColor:
                                            //           MyThemes.primaryColor,
                                            //       childrenPadding:
                                            //           const EdgeInsets
                                            //                   .symmetric(
                                            //               vertical: 5,
                                            //               horizontal: 5),
                                            //       collapsedBackgroundColor:
                                            //           MyThemes.secondryColor,
                                            //       title: Text(_item.namew
                                            //           .toString()),
                                            //       backgroundColor: Colors.white,
                                            //       iconColor:
                                            //           MyThemes.primaryColor,
                                            //       children: [
                                            //         Container(
                                            //           child: ColumnBuilder(
                                            //             itemCount: _item
                                            //                 .subcities.length,
                                            //             itemBuilder: (c, i) {
                                            //               var _item2 = _item
                                            //                   .subcities[i];
                                            //               return InkWell(
                                            //                 onTap: () {},
                                            //                 child: Container(
                                            //                   margin:
                                            //                       const EdgeInsets
                                            //                               .only(
                                            //                           top: 5,
                                            //                           right: 7,
                                            //                           left: 7),
                                            //                   child: Row(
                                            //                       children: [
                                            //                         Expanded(
                                            //                           child:
                                            //                               ClipRRect(
                                            //                             clipBehavior:
                                            //                                 Clip.hardEdge,
                                            //                             borderRadius:
                                            //                                 BorderRadius.all(Radius.circular(5)),
                                            //                             child:
                                            //                                 ElevatedButton(
                                            //                               clipBehavior:
                                            //                                   Clip.hardEdge,
                                            //                               onPressed:
                                            //                                   () async {
                                            //                                 await _postcityController.postCity(_item2.iD.toInt());
                                            //                                 if (!_postcityController.getcityResponse.status) {
                                            //                                   Get.back();
                                            //                                   init2();
                                            //                                 } else {
                                            //                                   ShowMSG().showSnackBar(_postcityController.getcityResponse.message);
                                            //                                 }
                                            //                               },
                                            //                               child:
                                            //                                   Container(
                                            //                                 margin:
                                            //                                     const EdgeInsets.only(top: 7),
                                            //                                 child:
                                            //                                     Text(
                                            //                                   _item2.name.toString().withPersianLetters(),
                                            //                                   style: TextStyle(color: MyThemes.primaryColor, fontSize: 18),
                                            //                                 ),
                                            //                               ),
                                            //                               style:
                                            //                                   ButtonStyle(
                                            //                                 backgroundColor:
                                            //                                     MaterialStateProperty.all(MyThemes.secondryColor),
                                            //                               ),
                                            //                             ),
                                            //                           ),
                                            //                         ),
                                            //                       ]),
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
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.location_on,
                                color: MyThemes.secondryColor,
                              ),
                            ),
                            Obx(() {
                              if (_cityController.getcityModel.isloading) {
                                return Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: simpleLoading());
                              }
                              return Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Text(
                                  _mainController.cityname,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 35),
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Text(
                  "متخصص هرکاری راحت اینجا پیدا کنید!",
                  style: TextStyle(
                    color: MyThemes.brown2,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              MainPageMainSlider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: HomeGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
