import 'package:hamekare_app/Model/response_model.dart';
import 'package:image_picker/image_picker.dart';





class ProfileResponse extends BaseResponseModel{
  ProfileResponse({
     this.data,
  });
  late ProfileModel? data;
  XFile? image;
  
  
  ProfileResponse.fromJson(Map<String, dynamic> json){
    data = ProfileModel.fromJson(json['data']);
    message = json['message'];
  }

  factory ProfileResponse.withError(Map<String, dynamic> json) {
    ProfileResponse item = ProfileResponse();
    item.status = json["status"];
    item.message = json["Message"];
    return item;
  }
}

class ProfileModel {
  ProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.address,
    this.displayName,
    this.profileImage,
  });

  late String? firstName;
  late String? lastName;
  late String? email;
  late String? contactNumber;
  late String? address;
  late String? displayName;
  late String? profileImage;
  
  ProfileModel.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    address = json['address'];
    displayName = json['display_name'];
    profileImage = json['profile_image'];
  }


}