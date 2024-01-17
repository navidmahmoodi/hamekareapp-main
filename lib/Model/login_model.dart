import 'package:hamekare_app/Model/response_model.dart';

class LoginModel extends BaseResponseModel {
  LoginModel({
    this.data,
  });
  LoginDataModel? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"] ?? true;
    message = json["message"] ?? "بروز خطا";
    data = LoginDataModel.fromJson(json['data']);
  }

  factory LoginModel.withError(ResponseModel response) {
    LoginModel item = LoginModel();
    item.status = response.status;
    item.message = response.message;
    item.errorCode = response.errorCode;
    return item;
  }
}

class LoginDataModel {
  LoginDataModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.userType,
    this.contactNumber,
    this.displayName,
    this.apiToken,
  });
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? userType;
  String? contactNumber;
  String? displayName;
  String? apiToken;

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    displayName = json['display_name'];
    apiToken = json['api_token'];
  }
}
