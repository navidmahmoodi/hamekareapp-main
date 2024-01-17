import 'package:get/get.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/response/slider_response.dart';

class SliderController extends GetxController {
  final _sliderResponse = SliderResponse().obs;
  SliderResponse get sliderResponse => _sliderResponse.value;
  final MainController _mainController = Get.find();

  Future<SliderResponse> getSlider() async {
    _sliderResponse.update((val) {
      val!.isloading = true;
    });
    _sliderResponse.value = await _mainController.api.getSlider();

    _sliderResponse.update((val) {
      val!.isloading = false;
    });
    return _sliderResponse.value;
  }
}
