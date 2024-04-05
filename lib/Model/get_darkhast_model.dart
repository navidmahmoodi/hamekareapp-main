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
    GetDarkhastResponse item = GetDarkhastResponse();
    item.status = json["status"];
    item.message = json["message"];
    return item;
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
  DateTime? date;
  late String? type;
  late String? status;
  late String? statusLabel;
  late String? description;
  late String? providerName;
  late String? customerName;
  late String? serviceName;
  late List<Handyman>? handyman;
  late int bookingId;

  GetDarkhastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    providerId = json['provider_id'];
    date = DateTime.tryParse(json['date']);
    price = json['price'];
    type = json['type'];
    status = json['status'];
    statusLabel = json['status_label'];
    description = json['description'];
    providerName = json['provider_name'];
    customerName = json['customer_name'];
    serviceName = json['service_name'];
    bookingId = json['booking_id'] ?? 0;
    handyman =
        List.from(json['handyman']).map((e) => Handyman.fromJson(e)).toList();
  }
}

class Handyman {
  Handyman(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.contactNumber,
      this.profileImage,
      this.displayname});
  late int? id;
  late String? firstName;
  late String? lastName;
  late String? username;
  late String? contactNumber;
  late String? profileImage;
  late String? displayname;

  Handyman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    contactNumber = json['contact_number'];
    profileImage = json['profile_image'];
    displayname = json['display_name'];
  }
}
