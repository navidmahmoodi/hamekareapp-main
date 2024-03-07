import 'package:hamekare_app/Model/response_model.dart';

class ServiceResponse extends BaseResponseModel {
  ServiceResponse();

  List<ServiceDataModel> services = [];

  ServiceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      services = List.from(json['data'])
          .map((e) => ServiceDataModel.fromJson(e))
          .toList();
    }
  }

  factory ServiceResponse.withError(Map<String, dynamic> json) {
    ServiceResponse item = ServiceResponse();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class ServiceDataModel {
  int id = 0;
  String name = "";
  int? categoryId;
  int? subcategoryId;
  int providerId = 0;
  int? price;
  String? priceFormat;
  String? type;
  int? discount;
  String? duration;
  int? status;
  String? description;
  int? isFeatured;
  String? providerName;
  String? providerImage;
  int? cityId;
  String? categoryName;
  String? subcategoryName;
  int? totalReview;
  int? totalRating;
  int? isFavourite;
  int? isSlot;
  List<String> attchments = [];

  ServiceDataModel({
    this.id = 0,
    this.name = "",
    this.categoryId,
    this.subcategoryId,
    this.providerId = 0,
    this.price,
    this.priceFormat,
    this.type,
    this.discount,
    this.duration,
    this.status,
    this.description,
    this.isFeatured,
    this.providerName,
    this.providerImage,
    this.cityId,
    this.categoryName,
    this.subcategoryName,
    this.totalReview,
    this.totalRating,
    this.isFavourite,
    this.isSlot,
    this.attchments = const [],
  });

  ServiceDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    providerId = json['provider_id'];
    price = json['price'];
    priceFormat = json['price_format'];
    type = json['type'];
    discount = json['discount'];
    duration = json['duration'];
    status = json['status'];
    description = json['description'];
    isFeatured = json['is_featured'];
    providerName = json['provider_name'];
    providerImage = json['provider_image'];
    cityId = json['city_id'];
    categoryName = json['category_name'];
    subcategoryName = json['subcategory_name'];
    totalReview = json['total_review'];
    totalRating = json['total_rating'];
    isFavourite = json['is_favourite'];
    isSlot = json['is_slot'];
    attchments =
        List.from(json['attchments']).map((e) => e.toString()).toList();
  }
}
