
import 'package:hamekare_app/Model/response_model.dart';

class OtpModel extends BaseResponseModel{
  OtpModel({
    this.isSuccess,
    this.data,
  });
  late bool? isSuccess;
  late Data? data;
  
  OtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    isSuccess = json['isSuccess'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }
   factory OtpModel.withError(Map<String, dynamic> json) {
    OtpModel item = OtpModel();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.email,
    this.gender,
    this.userRole,
    this.apiToken,
    this.profileImage,
    this.loginType,
  });
  late int? id;
  late String? firstName;
  late String? lastName;
  late String? mobile;
  late String? email;
  late String? gender;
  late List<String>? userRole;
  late String? apiToken;
  late String? profileImage;
  late String? loginType;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
    userRole = List.castFrom<dynamic, String>(json['user_role']);
    apiToken = json['api_token'];
    profileImage = json['profileImage'];
    loginType = json['loginType'];
  }


}