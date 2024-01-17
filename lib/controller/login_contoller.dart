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
    _loginResponse.update((val) {
      val!.isloading = true;
    });

    _loginResponse.value =
        await _mainController.api.postLogin(mobile, password);

    await _mainController.setToken(loginResponse.data!.apiToken.toString());
    print(loginResponse.data!.apiToken.toString());
    _loginResponse.update((val) {
      val!.isloading = false;
    });

    return _loginResponse.value;
  }

  Future<OtpModel> postOtp(String otp, String mobile) async {
    _otpResponse.update((val) {
      val!.isloading = true;
    });
    if (otp.length == 4) {
      _otpResponse.value = await _mainController.api.postOtp(mobile, otp);
      _mainController.setToken(otpResponse.data!.apiToken.toString());
      print(otpResponse.data!.apiToken.toString());
      _mainController.init();
      print(_otpResponse.value);
      otpResponse.message = "احراز هویت شما موفقیت آمیز بود";
    } else {
      otpResponse.message = "رمز یکبار مصرف صحیح نمی باشد";
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
