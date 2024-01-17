import 'package:hamekare_app/Model/response_model.dart';

class GetCityModel extends BaseResponseModel {
  GetCityModel({this.cities});
  late List<CityModel>? cities;

  GetCityModel.fromJson(List<dynamic> json) {
    cities = json.map((x) => CityModel.fromJson(x)).toList();
  }

  factory GetCityModel.withError(Map<String, dynamic> json) {
    GetCityModel _item = GetCityModel();
    _item.status = json["status"];
    _item.message = json["message"];
    return _item;
  }
}

class CityModel {
  int id = 0;
  String name = "";
  int countryId = 0;
  CityModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    countryId = json["country_id"];
  }
}
