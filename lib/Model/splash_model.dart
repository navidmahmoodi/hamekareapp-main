
import 'package:hamekare_app/Model/response_model.dart';

class SplashModel extends BaseResponseModel {
  SplashModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isSuccess
  });
  late int? id;
  late bool? isSuccess;
  late String? username;
  late String? firstName;
  late String? lastName;
  late String? email;

  SplashModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
  factory SplashModel.withError(Map<String, dynamic> json) {
    SplashModel item = SplashModel();
    item.status = json["isSuccess"];
    item.message = json["message"];
    return item;
  }
}
