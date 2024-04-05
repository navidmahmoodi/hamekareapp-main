import 'dart:async';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/check_otp_model.dart';
import 'package:hamekare_app/Model/login_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class LoginController extends GetxController {
  final _loginResponse = LoginModel().obs;
  LoginModel get loginResponse => _loginResponse.value;
  final _otpResponse = OtpModel().obs;
  OtpModel get otpResponse => _otpResponse.value;
  final _mainController = Get.put(MainController());

  final _levelClock = 60.obs;
  int get levelClock => _levelClock.value;

  void startTimer() {
    _levelClock.value = 60;
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_levelClock.value == 0) {
          timer.cancel();
        } else {
          _levelClock.value--;
        }
      },
    );
  }

  Future<LoginModel> postLogin(String password, String mobile) async {
    isloading = true;

    var response = await _mainController.api.postLogin(mobile, password);

    if (response.data == null) {
      response.status = false;
    }

    if (response.status) {
      _loginResponse.value = response;
      await _mainController.setToken(response.data!.apiToken.toString());
    }

    isloading = false;
    return response;
  }

  Future<OtpModel> postOtp(String otp, String mobile) async {
    _otpResponse.update((val) {
      val!.isloading = true;
    });
    if (otp.length == 5) {
      _otpResponse.value = await _mainController.api.postOtp(mobile, otp);
    }
    _otpResponse.update((val) {
      val!.isloading = false;
    });
    return _otpResponse.value;
  }

  Future<LoginModel> getToken() async {
    return _loginResponse.value;
  }

  set isloading(bool value) => _loginResponse.update((val) {
        val!.isloading = value;
      });
  bool get isloading => loginResponse.isloading;
}
