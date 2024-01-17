import 'package:get/get.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class RateReqController extends GetxController {
  final MainController _mainController = Get.find();

  final _rateReqController = ResponseModel().obs;
  ResponseModel get rateReqController => _rateReqController.value;
  bool get isloading => rateReqController.isloading;
  set isloading(bool v) =>
      _rateReqController.update((val) => val!.isLoading = v);

  Future<ResponseModel> rateReqApp(param) async {
    isloading = true;

    var response = await _mainController.api.rateReqApp(param);

    isloading = false;
    return response;
  }
}
