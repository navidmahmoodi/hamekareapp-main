import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/screen/home/service/service_page.dart';
import 'package:hamekare_app/tools/tools.dart';

import '../screen/home/choosetimepage/choosetime.dart';

class HomeGridView extends StatelessWidget {
  // List<HomeGridViewModel> get _list => homegridviewtemp;
  HomeGridView({Key? key}) : super(key: key);
  final MainController _controller = Get.find();
  init() async {
    //  if (_controller.categoryResponse.result.isEmpty) {
    _controller.getCategory();
    // }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Obx(() {
      if (_controller.categoryResponse.isloading) {
        return simpleLoading();
      }
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _controller.categoryResponse.data!.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 30,
          childAspectRatio: .5,
        ),
        itemBuilder: (context, i) {
          var item = _controller.categoryResponse.data![i];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  if (item.subCategories.isNotEmpty) {
                    Get.to(() => ServicePage(sub: item.subCategories));
                  } else {
                    Get.to(() => ChooseTime(
                          reqName: item.name.toString(),
                          id: item.id!,
                        ));
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Image.asset(
                    imagePath("1.png"),
                    // scale: 12,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 1.5),
                child: Text(
                  item.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyThemes.primaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
