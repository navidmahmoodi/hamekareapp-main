import 'package:get/get.dart';
import 'package:hamekare_app/Model/response_model.dart';

class RateReqController extends GetxController {
  final _rateReqController = ResponseModel().obs;
  ResponseModel get rateReqController => _rateReqController.value;

  Future<ResponseModel> rateReqApp(String comment, int id, int rate) async {
    _rateReqController.update((val) {
      val!.isloading = true;
    });

    // await _mainController.api.rateReqApp(comment, id, rate);
    print(rate);

    _rateReqController.update((val) {
      val!.isloading = false;
    });
    return _rateReqController.value;
  }
}
