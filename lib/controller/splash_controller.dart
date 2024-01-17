import 'package:get/get.dart';
import 'package:hamekare_app/Model/splash_model.dart';

import 'main_controller.dart';

class SplashController extends GetxController {
  final _splashModel = SplashModel().obs;
  SplashModel get splashResponse => _splashModel.value;
  final MainController _mainController = Get.find();

  Future<SplashModel> getSplash() async {
    _splashModel.update((val) {
      val!.isloading = true;
    });
    await _mainController.init();
    await Future.delayed(const Duration(seconds: 2));
    // _splashModel.value =
    //     await _mainController.api.splash(_mainController.token, 1);

    _splashModel.update((val) {
      val!.isloading = false;
    });
    return _splashModel.value;
  }
}
