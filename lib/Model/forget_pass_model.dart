import 'package:hamekare_app/Model/response_model.dart';

class ForgetPasswordModel extends BaseResponseModel {
  ForgetPasswordModel({
    this.isSuccess,
  });
  bool? isSuccess;

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
  }
  factory ForgetPasswordModel.withError(Map<String, dynamic> json) {
    ForgetPasswordModel item = ForgetPasswordModel();
    item.status = json["isSuccess"] ?? false;
    item.message = json["Message"] ?? "";
    return item;
  }
}
