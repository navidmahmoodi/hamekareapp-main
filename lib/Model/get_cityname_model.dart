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
    GetCityName _item = GetCityName();
    _item.status = json["status"];
    _item.message = json["message"];
    return _item;
  }
}
