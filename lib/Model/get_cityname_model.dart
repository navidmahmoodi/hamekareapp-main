import 'package:hamekare_app/Model/response_model.dart';

class GetCityName extends BaseResponseModel {
  GetCityName({
   this.userCity="",
  });
  late String userCity="";

  GetCityName.fromJson(Map<String, dynamic> json) {
    userCity = json['UserCity'];
  }
    factory GetCityName.withError(Map<String, dynamic> json) {
    GetCityName item = GetCityName();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}
