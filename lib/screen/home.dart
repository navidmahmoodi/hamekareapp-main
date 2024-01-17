import 'dart:io';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hamekare_app/screen/home/cartpage.dart';
import 'package:hamekare_app/screen/home/home_screen.dart';
import 'package:hamekare_app/screen/home/settingscreen.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = Get.put(HomeController());

  final List<Widget> _pages = [
    HomeScreen(),
    CartPage(),
    SettingScreen(),
  ];
  int currentIndex = 0;

  openDialPad(String phoneNumber) async {
    Uri url = Uri(scheme: "tel", path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Can't open dial pad.");
    }
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "برای خروج دوباره برگشت را بفشارید");
      return Future.value(false);
    }
    return exit(0);
  }

  final PageController pageController = PageController();
  void onAddButtonTapped(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialPad("09179456585");
        },
        backgroundColor: MyThemes.secondryColor,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.call)),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        backgroundColor: MyThemes.primaryColor,
        iconSize: 29,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        animationDuration: const Duration(milliseconds: 150),
        curve: Curves.ease,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
          onAddButtonTapped(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('خانه'),
            activeColor: MyThemes.secondryColor,
            textAlign: TextAlign.center,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.shopping_cart_rounded),
            textAlign: TextAlign.center,
            title: const Text('سفارشات شما'),
            activeColor: MyThemes.secondryColor,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('ناحیه کاربری'),
            textAlign: TextAlign.center,
            activeColor: MyThemes.secondryColor,
            inactiveColor: Colors.white,
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              scrollBehavior: const ScrollBehavior(),
              allowImplicitScrolling: false,
              onPageChanged: (i) {
                _controller.currentIndex = i;
              },
              itemCount: _pages.length,
              itemBuilder: (c, i) {
                return _pages[i];
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeController extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int val) => _currentIndex.value = val;
}
