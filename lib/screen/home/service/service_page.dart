import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/category_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/screen/home/choosetimepage/choosetime.dart';

import 'package:hamekare_app/tools/tools.dart';

class ServicePage extends StatelessWidget {
  ServicePage({Key? key, required this.catIndex}) : super(key: key);
  final int catIndex;
  CategoryModel get cat => _controller.categoryResponse.data![catIndex];

  final MainController _controller = Get.find();

  Widget _subBox(int index) {
    return Obx(() {
      SubCategories item = cat.subCategories[index];
      return Container(
        margin: const EdgeInsets.only(left: 4),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: item.selected
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1,
                    color: item.selected ? Colors.blue : Colors.black),
              ),
              child: InkWell(
                onTap: () async {
                  _controller.changeSelectedSub(catIndex, index);
                  init(item.id);
                },
                child: item.categoryImage == null
                    ? Image.asset(imagePath("1.png"))
                    : Image.network(item.categoryImage!),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                item.name.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: MyThemes.primaryColor,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  init(int id) async {
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    await _controller.getServices(id);
    });
  }

  Widget _serviceBox(int index) {
    var item = _controller.services[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => ChooseTime(service:item));
        },
        child: Column(
          children: [
            item.attchments.isEmpty
                ? Image.asset(
                    imagePath("1.png"),
                    height: 200,
                  )
                : Image.network(
                    item.attchments.first,
                    height: 200,
                  ),
            Text(item.name),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    init(cat.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("یکی از خدمات را انتخاب کنید"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   margin: const EdgeInsets.only(top: 15),
              //   child: Image.asset(
              //     imagePath("peik2.png"),
              //     fit: BoxFit.fitWidth,
              //     scale: 1,
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 15),
                  itemCount: cat.subCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 30,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (c, i) => _subBox(i),
                ),
              ),
              Obx(() {
                if (_controller.isloadingService) {
                  return simpleLoading();
                }
                if (_controller.services.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text("مثداری یافت نشد."),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.services.length,
                  itemBuilder: (context, index) => _serviceBox(index),
                );
              })
              // Container(
              //   padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
              //   child: Text(
              //     "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی .",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(color: MyThemes.primaryColor, fontSize: 15.5),
              //   ),
              // )
            ],
          ),
          // Positioned(
          //   top: 30,
          //   left: 25,
          //   child: FloatingActionButton(
          //     backgroundColor: MyThemes.secondryColor,
          //     splashColor: MyThemes.secondryColor,
          //     onPressed: () {
          //       print("object");
          //       Get.back();
          //     },
          //     child: Icon(
          //       Icons.arrow_forward,
          //       color: MyThemes.primaryColor,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
