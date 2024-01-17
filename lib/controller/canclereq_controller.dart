// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'main_controller.dart';

class CancleReqController extends GetxController {
  final _cancleReqController = ResponseModel().obs;
  ResponseModel get cancleReqController => _cancleReqController.value;
  final _mainController = Get.put(MainController());

  Future<ResponseModel> cancleReq(int id) async {
    _cancleReqController.update((val) {
      val!.isloading = true;
    });

    // await _mainController.api.postCancel(id);

    _cancleReqController.update((val) {
      val!.isloading = false;
    });
    return _cancleReqController.value;
  }
}
