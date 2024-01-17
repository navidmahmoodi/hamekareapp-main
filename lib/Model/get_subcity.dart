import 'package:hamekare_app/Model/response_model.dart';

class GetSubCityModel extends BaseResponseModel {
  GetSubCityModel({this.cities});
  late List<SubCityModel>? cities;

  GetSubCityModel.fromJson(List<dynamic> json) {
    cities = json.map((x) => SubCityModel.fromJson(x)).toList();
  }

  factory GetSubCityModel.withError(Map<String, dynamic> json) {
    GetSubCityModel item = GetSubCityModel();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class SubCityModel {
  SubCityModel({this.countryId, this.id, this.name});
  late int? id;
  late String? name;
  late int? countryId;
  SubCityModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    countryId = json["country_id"];
  }
}
