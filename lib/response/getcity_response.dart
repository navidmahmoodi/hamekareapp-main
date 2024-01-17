import 'package:hamekare_app/Model/response_model.dart';
import '../Model/get_city_model.dart';

class GetCityResponse extends BaseResponseModel {
  List<GetCityResponse> getcity = [];
  List<GetCityResponse> subcities = [];
  GetCityResponse(
      {message = "",
      isError = false,
      errorCode = 200,
      isloading = false,
      this.getcity = const [],
      this.subcities = const []});

  factory GetCityResponse.fromJson(Map<String, dynamic> json) {
    return GetCityResponse(
        getcity: (json["result"] as List)
            .map((e) => GetCityResponse.fromJson(e))
            .toList(),
        subcities: ((json["Childs"] ?? []) as List)
            .map((e) => GetCityResponse.fromJson(e))
            .toList());
  }

  factory GetCityResponse.withError(Map<String, dynamic> json) {
    return GetCityResponse(
      isError: json["isError"],
      message: json["message"],
      errorCode: json["errorCode"],
    );
  }
}
