import 'package:get/get.dart';
import 'package:hamekare_app/Model/splash_model.dart';
import 'main_controller.dart';

class SplashController extends GetxController {
  final _splashModel = SplashModel().obs;
  SplashModel get splashModel => _splashModel.value;
  final _mainController = Get.put(MainController());

  Future<SplashModel> getSplash() async {
    _splashModel.update((val) {
      val!.isloading = true;
    });
    await _mainController.init();
    // print(_mainController.token);
    await Future.delayed(const Duration(seconds: 2));
    _splashModel.value = await _mainController.api.getSplash();
    // print(splashModel);

    _splashModel.update((val) {
      val!.isloading = false;
    });
    return _splashModel.value;
  }
}
