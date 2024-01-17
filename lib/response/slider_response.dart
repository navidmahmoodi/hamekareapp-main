import 'package:hamekare_app/Model/response_model.dart';

class SliderResponse extends BaseResponseModel {
  SliderResponse({
    this.data,
  });
  late List<Data>? data;

  SliderResponse.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
   factory SliderResponse.withError(Map<String, dynamic> json) {
    SliderResponse _item = SliderResponse();
    _item.status = json["status"];
    _item.message = json["message"];
    return _item;
  }
}

class Data {
  Data({
   this.id,
   this.title,
   this.serviceName,
   this.sliderImage,
  });
  late int? id;
  late String? title;
  late String? serviceName;
  late String? sliderImage;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    serviceName = json['service_name'];
    sliderImage = json['slider_image'];
  }
}
