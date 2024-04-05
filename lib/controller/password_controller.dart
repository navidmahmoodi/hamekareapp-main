import 'package:get/get.dart';
import 'package:hamekare_app/Model/forget_pass_model.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class PasswordController extends GetxController {
  final _passwordResponse = ForgetPasswordModel().obs;
  ForgetPasswordModel get passwordResponse => _passwordResponse.value;
  final MainController _mainController = Get.find();

  Future<ForgetPasswordModel> changePassReq(String mobile) async {
    _passwordResponse.update((val) {
      val!.isloading = true;
    });
    _passwordResponse.value =
        await _mainController.api.changePasswordRequest(mobile);
    _passwordResponse.update((val) {
      val!.isloading = false;
    });

    return _passwordResponse.value;
  }

  Future<ForgetPasswordModel> changePassConfirm(
      String otp, String mobile, String pas1, String pas2) async {
    _passwordResponse.update((val) {
      val!.isloading = true;
    });
    _passwordResponse.value = await _mainController.api
        .changePasswordConfimation(otp, mobile, pas1, pas2);
    _passwordResponse.update((val) {
      val!.isloading = false;
    });

    return _passwordResponse.value;
  }
}
