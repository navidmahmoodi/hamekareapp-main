// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hamekare_app/Model/category_model.dart';

// import 'package:hamekare_app/tools/tools.dart';

// import '../choosetimepage/choosetime.dart';

// class ServicePage extends StatelessWidget {
//   ServicePage({Key? key, required this.sub}) : super(key: key);
//   final List<SubCategories> sub;

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     var items = sub;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           ListView(
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 15),
//                 child: Image.asset(
//                   imagePath("peik2.png"),
//                   fit: BoxFit.fitWidth,
//                   scale: 1,
//                 ),
//               ),
//               Text(
//                 "یکی از خدمات را انتخاب کنید",
//                 style: MyThemes.headline5,
//                 textAlign: TextAlign.center,
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 25, right: 25),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding: const EdgeInsets.only(top: 15),
//                   itemCount: items.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                     crossAxisSpacing: 30,
//                     childAspectRatio: 0.6,
//                   ),
//                   itemBuilder: (C, i) {
//                     var item = items[i];
//                     return Container(
//                       margin: const EdgeInsets.only(left: 4),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 7, horizontal: 7),
//                             decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.5),
//                                   spreadRadius: 1,
//                                   blurRadius: 3,
//                                 ),
//                               ],
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(width: 1, color: Colors.black),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 Get.to(() => ChooseTime(
//                                     reqName: item.name.toString(),  
//                                     id: item.id!.toInt()));
//                               },
//                               child: Image.network(item.featureImage.toString(),
//                                 // scale: 12,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(top: 5),
//                             child: Text(
//                               item.name.toString(),
//                               textAlign: TextAlign.center,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 2,
//                               style: TextStyle(
//                                 color: MyThemes.primaryColor,
//                                 fontSize: 11,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Container(
//               //   padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
//               //   child: Text(
//               //     "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی .",
//               //     textAlign: TextAlign.center,
//               //     style: TextStyle(color: MyThemes.primaryColor, fontSize: 15.5),
//               //   ),
//               // )
//             ],
//           ),
//           Positioned(
//             top: 30,
//             left: 25,
//             child: FloatingActionButton(
//               backgroundColor: MyThemes.secondryColor,
//               splashColor: MyThemes.secondryColor,
//               onPressed: () {
//                 print("object");
//                 Get.back();
//               },
//               child: Icon(
//                 Icons.arrow_forward,
//                 color: MyThemes.primaryColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
