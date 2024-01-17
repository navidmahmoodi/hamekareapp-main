import 'package:get/get.dart';
import 'package:hamekare_app/Model/register_model.dart';
import 'main_controller.dart';

class RegisterMoshtariController extends GetxController {
  final _postExpertController = RegisterModel().obs;
  RegisterModel get postExpertController => _postExpertController.value;
  final MainController _mainController = Get.find();

  bool get isloading => postExpertController.isloading;
  set isloading(bool v) =>
      _postExpertController.update((val) => val!.isloading = false);

  Future<RegisterModel> postSignUp(
    String firstName,
    String lastName,
    String email,
    String mobile,
    String password,
    String username,
  ) async {
    isloading = true;

    _postExpertController.value = await _mainController.api
        .postSignUp(firstName, lastName, email, mobile, password, username);

    if (postExpertController.status) {
      _mainController.setToken(postExpertController.data!.apiToken!);
    }

    isloading = false;
    return _postExpertController.value;
  }
}
