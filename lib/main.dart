import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_localizations/flutter_localizations.dart' as localized;
import 'package:hamekare_app/screen/Intro/intro.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/screen/Login/city.dart';
import 'package:hamekare_app/screen/Login/login_phone.dart';
import 'package:hamekare_app/screen/Login/video_screen.dart';
import 'package:hamekare_app/screen/home.dart';
import 'package:hamekare_app/screen/home/cartpage.dart';
import 'package:hamekare_app/screen/home/detailpage/cartfulldetailpage.dart';
import 'package:hamekare_app/screen/home/setting_inside_pages/profile.dart';
import 'package:hamekare_app/screen/home/settingscreen.dart';
import 'package:hamekare_app/screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    // Get.put(()=> LoginController());
    return GetMaterialApp(
      title: 'Hamekare',
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),
      // localizationsDelegates: const [
      //   localized.GlobalMaterialLocalizations.delegate,
      //   localized.GlobalWidgetsLocalizations.delegate,
      //   localized.GlobalCupertinoLocalizations.delegate,
      // ],
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/intro', page: () => IntroScreen()),
        GetPage(name: '/splash', page: () => Splash()),
        GetPage(name: '/login', page: () => LoginScreen()),
        // GetPage(name: '/otp', page: () => OtpScreen()),
        GetPage(name: '/cart', page: () => CartPage()),
        GetPage(name: '/setting', page: () => SettingScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/video', page: () => const VideoScreen()),
        GetPage(name: '/city', page: () => CityScreen()),
        GetPage(name: '/cartFullDetail', page: () => CartFullDetail()),
      ],
      theme: ThemeData(
        // useMaterial3:true,
        fontFamily: "iranrounded",
        primarySwatch: Colors.blue,
      ),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Builder(
            builder: (BuildContext context) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child ?? Container(),
              );
            },
          ),
        );
      },
      // initialRoute: "/",
      home: Splash(),
    );
  }
}
