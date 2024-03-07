import 'dart:io';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/screen/home/cartpage.dart';
import 'package:hamekare_app/screen/home/dashboard_screen.dart';
import 'package:hamekare_app/screen/home/settingscreen.dart';
import 'package:hamekare_app/tools/tools.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());

  final List<Widget> _pages = [
    DashboardScreen(),
    CartPage(),
    SettingScreen(),
  ];
  int currentIndex = 0;

  // openDialPad(String phoneNumber) async {
  bool onWillPop(bool v) {
    DateTime now = DateTime.now();
    if (_controller.currentBackPressTime == null ||
        now.difference(_controller.currentBackPressTime!) >
            const Duration(seconds: 2)) {
      _controller.currentBackPressTime = now;
      Fluttertoast.showToast(msg: "برای خروج دوباره برگشت را بفشارید");
      return false;
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
          launchURL("tel:09179456585");
        },
        backgroundColor: MyThemes.secondryColor,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.call)),
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
      body: PopScope(
        onPopInvoked: onWillPop,
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

  DateTime? currentBackPressTime;
}
