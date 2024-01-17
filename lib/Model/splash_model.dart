import 'package:hamekare_app/Model/response_model.dart';

class SplashModel extends BaseResponseModel {
  SplashModel();
  int ?appID = 0;
  late Result result;

  SplashModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isloading = json['Isloading'];
    message = json['Message'];
    appID = json['AppID'];
    result = Result.fromJson(json['result']);
  }
 factory SplashModel.withError(Map<String, dynamic> json) {
    SplashModel item = SplashModel();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class Result {
  Result({
    required this.name,
    required this.phone,
  });
  String ?name;
  String ?phone;

  Result.fromJson(Map<String, dynamic> json) {
    name = null;
    phone = null;
  }
}
