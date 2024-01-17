import 'package:hamekare_app/Model/response_model.dart';

class GetDarkhastResponse extends BaseResponseModel {
  GetDarkhastResponse({
    this.data,
  });
  late List<GetDarkhastModel>? data;

  GetDarkhastResponse.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'])
        .map((e) => GetDarkhastModel.fromJson(e))
        .toList();
  }

  factory GetDarkhastResponse.withError(Map<String, dynamic> json) {
    GetDarkhastResponse _item = GetDarkhastResponse();
    _item.status = json["status"];
    _item.message = json["message"];
    return _item;
  }
}

class GetDarkhastModel {
  GetDarkhastModel({
    this.id,
    this.address,
    this.customerId,
    this.serviceId,
    this.providerId,
    this.date,
    this.price,
    this.type,
    this.status,
    this.statusLabel,
    this.description,
    this.providerName,
    this.customerName,
    this.serviceName,
    this.handyman,
  });
  late int? id;
  late String? address;
  late int? customerId;
  late int? serviceId;
  late int? providerId;
  late int? price;
  late String? date;
  late String? type;
  late String? status;
  late String? statusLabel;
  late String? description;
  late String? providerName;
  late String? customerName;
  late String? serviceName;
  late List<dynamic>? handyman;

  GetDarkhastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    providerId = json['provider_id'];
    date = json['date'];
    price = json['price'];
    type = json['type'];
    status = json['status'];
    statusLabel = json['status_label'];
    description = json['description'];
    providerName = json['provider_name'];
    customerName = json['customer_name'];
    serviceName = json['service_name'];
    handyman = List.castFrom<dynamic, dynamic>(json['handyman']);
  }
}
