import 'package:get/get.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class PasswordController extends GetxController {
  final _passwordResponse = ResponseModel().obs;
  ResponseModel get passwordResponse => _passwordResponse.value;
  final MainController _mainController = Get.find();

  Future<ResponseModel> changePass(String old, String neww) async {
    _passwordResponse.update((val) {
      val!.isloading = true;
    });
    _passwordResponse.value =
        await _mainController.api.changePassword(old, neww);
    _passwordResponse.update((val) {
      val!.isloading = false;
    });

    return _passwordResponse.value;
  }
}
