import 'package:hamekare_app/Model/response_model.dart';

class RegisterModel extends BaseResponseModel{
  RegisterModel({
    this.data,
  });
  late bool isSuccess;
  late Data ?data;
  
  RegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    isSuccess = json['isSuccess'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }
    factory RegisterModel.withError(Map<String, dynamic> json) {
    RegisterModel item = RegisterModel();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class Data {
  Data({
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
  
  Data.fromJson(Map<String, dynamic> json){
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