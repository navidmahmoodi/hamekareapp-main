import 'package:hamekare_app/Model/response_model.dart';

class RegisterModel extends BaseResponseModel {
  RegisterModel({
    this.data,
  });
  bool? isSuccess;
  RegisterDataModel? data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) data = RegisterDataModel.fromJson(json['data']);

    if (isSuccess = json['isSuccess'] != null) {
      isSuccess = json['isSuccess'];
    } else {
      isSuccess = true;
    }
    message = json['message'];
  }
  factory RegisterModel.withError(Map<String, dynamic> json) {
    RegisterModel item = RegisterModel();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class RegisterDataModel {
  RegisterDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.apiToken,
    required this.avatar,
    required this.loginType,
  });
  late int id;
  late String firstName;
  late String lastName;
  late String? username;
  late String? email;
  late String? apiToken;
  late String? avatar;
  late String? loginType;

  RegisterDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    apiToken = json['api_token'];
    avatar = json['avatar'];
    loginType = json['login_type'];
  }
}
