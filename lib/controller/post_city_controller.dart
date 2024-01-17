import 'package:get/get.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class PostCityController extends GetxController {
  final _postCityResponse = ResponseModel().obs;
  ResponseModel get getcityResponse => _postCityResponse.value;
  // ignore: unused_field
  final MainController _mainController = Get.find();

  Future<ResponseModel> postCity(int cityId) async {
    _postCityResponse.update((val) {
      val!.isloading = true;
    });
    // _postCityResponse.value =
    //     await _mainController.api.setCityUser(_mainController.token, cityId);

    _postCityResponse.update((val) {
      val!.isloading = false;
    });
    _postCityResponse.value.message = "خطا در اتصال به اینترنت";

    return _postCityResponse.value;
  }
}
