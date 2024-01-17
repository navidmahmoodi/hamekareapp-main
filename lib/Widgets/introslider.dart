// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:get/get.dart';
// import 'package:hamekare_app/Model/introslidermodel.dart';
// import 'package:hamekare_app/Model/temp/introslidertemp.dart';
// import 'package:hamekare_app/Theme/theme2.dart';
// import 'package:hamekare_app/tools/common.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:intl/intl.dart';
// import 'dart:ui' as ui;

// class IntroSlider extends StatelessWidget {
//   IntroSlider({Key? key}) : super(key: key);
//   List<IntroImageTextModel> get _list => IntroImageTextModell;
//   final _controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     // double size = Get.size as double;

//     double width = MediaQuery.of(context).size.width;
//     Size sizeWidth = MediaQuery.of(context).size;
//     return PageView.builder(
//       scrollDirection: Axis.horizontal,
//       reverse: true,
//       controller: _controller,
//       itemCount: IntroImageTextModell.length,
//       itemBuilder: (c, i) {
//         var _item = _list[i];
//         return Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 clipBehavior: Clip.hardEdge,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 2.5, color: Colors.black)),
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
//                   child: Image.asset(
//                     _item.image,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               // flex: 8,
//               child: Text(
//                 _item.title,
//                 style: MyThemes.headline2,
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               child: Text(
//                 _item.text,
//                 style: MyThemes.bodyText3,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SmoothPageIndicator(
//               controller: _controller,
//               textDirection: ui.TextDirection.ltr,
//               count: _list.length,
//               axisDirection: Axis.horizontal,
//               effect: ExpandingDotsEffect(
//                 radius: 17,
//                 dotHeight: 18,
//                 dotWidth: 18,
//                 // paintStyle: PaintingStyle.stroke,
//                 strokeWidth: 3,
//                 spacing: 9,
//                 expansionFactor: 2.1,
//                 dotColor: MyThemes.primaryColor,
//                 activeDotColor: MyThemes.primaryColor,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
