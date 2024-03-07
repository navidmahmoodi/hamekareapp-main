import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/main_slider_controller.dart';
import 'package:hamekare_app/tools/tools.dart';

class MainPageMainSlider extends StatelessWidget {
  MainPageMainSlider({
    Key? key,
  }) : super(key: key);
  final _controller = Get.put(SliderController());
  init() async {
    // if (_controller.sliderResponse.data!.isEmpty) {
    await _controller.getSlider();
    // }
  }

  @override
  Widget build(BuildContext context) {
    init();
    double size = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          if (_controller.sliderResponse.isloading) {
            return simpleLoading();
          }
          return CarouselSlider.builder(
            itemCount: _controller.sliderResponse.data?.length,
            itemBuilder: (context, index, i) {
              var item = _controller.sliderResponse.data![index];

              return InkWell(
                // onTap: () {
                //   Get.to( () => ChooseTime(
                //         reqName: item.title.toString(),
                //         id: item.id!.toInt(),
                //       ));
                // },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 3,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              item.sliderImage.toString(),
                              fit: BoxFit.fill,
                              width: size,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(
                          item.title.toString(),
                          style:
                              TextStyle(color: MyThemes.brown2, fontSize: 18),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(
                      //       bottom: 10, right: 10, left: 10),
                      //   clipBehavior: Clip.antiAliasWithSaveLayer,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: MyThemes.brown,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: const EdgeInsets.only(
                      //             right: 10, top: 2.5, bottom: 2.5),
                      //         child: Text(
                      //           "حدود هزینه",
                      //           style: TextStyle(
                      //               color: MyThemes.secondryColor,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //       const Spacer(),
                      //       Container(
                      //         margin: const EdgeInsets.only(left: 10),
                      //         child: Text(
                      //           "${_item.title}",
                      //           style: TextStyle(
                      //               color: MyThemes.secondryColor,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              pauseAutoPlayOnTouch: true,
              autoPlay: true,
              autoPlayCurve: Curves.easeIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            ),
          );
        }),
      ],
    );
  }
}
