import 'package:get/get.dart';
import 'package:hamekare_app/Model/darkhast_model.dart';
import 'package:hamekare_app/Model/get_darkhast_model.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class DarkhastController extends GetxController {
  final _postDarkhast = PostDarkhast().obs;
  PostDarkhast get postDarkhast => _postDarkhast.value;
  final _getDarkhast = GetDarkhastResponse().obs;
  GetDarkhastResponse get getDarkhast => _getDarkhast.value;
  final mainController = Get.put(MainController());

  Future<PostDarkhast> postdarkhast(
      String date, int id, String desc, String adress) async {
    _postDarkhast.update((val) {
      val!.isloading = true;
    });

    _postDarkhast.value = await mainController.api.postDarkhast(
      date.toString(),
      adress,
      desc,
      id,
    );
    _postDarkhast.update((val) {
      val!.isloading = false;
    });
    return _postDarkhast.value;
  }

  Future<GetDarkhastResponse> getDarkhsat() async {
    _getDarkhast.update((val) {
      val!.isloading = true;
    });

    _getDarkhast.value = await mainController.api.getDarkhsat();
    _getDarkhast.update((val) {
      val!.isloading = false;
    });
    return _getDarkhast.value;
  }

    final _updateResponse = ResponseModel().obs;
  ResponseModel get updateResponse => _updateResponse.value;
   Future<ResponseModel> updateDarkhsat(int id , String status) async {
    _updateResponse.update((val) {
      val!.isloading = true;
    });

    _updateResponse.value = await mainController.api.updateDarkhsat(id,status);
    _updateResponse.update((val) {
      val!.isloading = false;
    });
    return _updateResponse.value;
  }
  // bool get isloading => payResponse.isloading;
  // set isloading(bool v) => _payResponse.update((val) => val!.isloading = v);

  // Future<ResponseModel> pay(int id) async {
  //   isloading = true;
  //   var response = await mainController.api.requestPay(id);
  //   if (!response.status) {
  //     payResponse.message = response.message;
  //   }
  //   isloading = false;
  //   return payResponse;
  // }
}
