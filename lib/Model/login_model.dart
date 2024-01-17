import 'package:hamekare_app/Model/response_model.dart';

class LoginModel extends BaseResponseModel{
  LoginModel({
    this.data,
  });
  late Data? data;
  
  LoginModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }
 factory LoginModel.withError(Map<String, dynamic> json) {
    LoginModel _item = LoginModel();
    _item.status = json["status"];
    _item.message = json["message"];
    return _item;
  }
}

class Data {
  Data({
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
  late int? id;
  late String? username;
  late String? firstName;
  late String? lastName;
  late String? email;
  late String? userType;
  late String? contactNumber;
  late String? displayName;
  late String? apiToken;
  
  Data.fromJson(Map<String, dynamic> json){
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