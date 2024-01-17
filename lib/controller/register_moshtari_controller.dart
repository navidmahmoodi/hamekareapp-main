import 'package:get/get.dart';
import 'package:hamekare_app/Model/register_model.dart';
import 'main_controller.dart';

class RegisterMoshtariController extends GetxController {
  final _postExpertController = RegisterModel().obs;
  RegisterModel get postExpertController => _postExpertController.value;
  final _mainController = Get.put(MainController());

  Future<RegisterModel> postSignUp(String firstName, String lastName,
      String email, String mobile, String password,String username) async {
    _postExpertController.update((val) {
      val!.isloading = true;
    });
    _postExpertController.value = await _mainController.api
        .postSignUp(firstName, lastName, email, mobile, password,username);
    _postExpertController.update((val) {
      val!.isloading = false;
    });
    return _postExpertController.value;
  }
}