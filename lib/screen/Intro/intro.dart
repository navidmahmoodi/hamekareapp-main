import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/intro_slider_model.dart';
import 'package:hamekare_app/Model/temp/introslidertemp.dart';
import 'package:hamekare_app/Theme/theme2.dart';
import 'package:hamekare_app/screen/Login/login_phone.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  List<IntroImageTextModel> get _list => introImageTextList;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/5.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 15),
              child: FittedBox(
                child: Text(
                  "به همه کاره خوش اومدی",
                  style: MyThemes.headline1,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  controller: _controller,
                  itemCount: _list.length,
                  itemBuilder: (c, i) {
                    var _item = _list[i];
                    return Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.5, color: Colors.black)),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 32),
                              child: Image.asset(_item.image,
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: FittedBox(
                            child: Text(
                              _item.title,
                              style: MyThemes.headline2,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
                          child: Text(
                            _item.text,
                            maxLines: 3,
                            style: MyThemes.bodyText3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: MyThemes.secondryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SmoothPageIndicator(
                controller: _controller,
                textDirection: TextDirection.ltr,
                count: _list.length,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  radius: 17,
                  dotHeight: 18,
                  dotWidth: 18,
                  // paintStyle: PaintingStyle.stroke,
                  strokeWidth: 3,
                  spacing: 9,
                  expansionFactor: 2.1,
                  dotColor: MyThemes.primaryColor,
                  activeDotColor: MyThemes.primaryColor,
                ),
              ),
            ),
            Container(
              width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 35),
              decoration: const BoxDecoration(),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                child: Text(
                  "ورود به برنامه",
                  style: MyThemes.headline1,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(color: MyThemes.secondryColor, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
