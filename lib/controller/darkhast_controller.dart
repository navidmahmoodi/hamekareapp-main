import 'package:get/get.dart';
import 'package:hamekare_app/Model/darkhast_model.dart';
import 'package:hamekare_app/Model/get_darkhast_model.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DarkhastController extends GetxController {
  final _postDarkhast = PostDarkhast().obs;
  PostDarkhast get postDarkhast => _postDarkhast.value;
  final _getDarkhast = GetDarkhastResponse().obs;
  GetDarkhastResponse get getDarkhast => _getDarkhast.value;
  final mainController = Get.put(MainController());

  Future<PostDarkhast> postdarkhast(String startDateTime, String time , int service , int branchId, String note,String adress,DateTime date) async {
    _postDarkhast.update((val) {
      val!.isloading = true;
    });

    _postDarkhast.value = await mainController.api.postDarkhast(
      startDateTime,
      date,
      time,
      service,
      adress,
      note,
      branchId
    );

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

  final _payResponse = ResponseModel().obs;
  ResponseModel get payResponse => _payResponse.value;
  bool get isloading => payResponse.isloading;
  set isloading(bool v) => _payResponse.update((val) => val!.isloading = v);

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
