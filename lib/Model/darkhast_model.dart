import 'package:hamekare_app/Model/response_model.dart';

class PostDarkhast extends BaseResponseModel{
  PostDarkhast({
     this.bookingId,
  });
  late int? bookingId;
  
  PostDarkhast.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    bookingId = json['booking_id'];
  }
  factory PostDarkhast.withError(Map<String, dynamic> json) {
    PostDarkhast item = PostDarkhast();
    item.status = json["status"];
    item.message = json["Message"];
    return item;
  }

}
