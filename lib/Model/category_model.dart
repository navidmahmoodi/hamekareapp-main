import 'package:hamekare_app/Model/response_model.dart';

class CategoryModel extends BaseResponseModel{
  CategoryModel({
     this.data,
  });
  late List<Data>? data;
  
  CategoryModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
    factory CategoryModel.withError(Map<String, dynamic> json) {
    CategoryModel item = CategoryModel();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}


class Data {
  Data({
    required this.id,
    required this.name,
    required this.categoryImage,
  });
  late int? id;
  late String? name;
  late String? categoryImage;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    categoryImage = json['category_image'];
  }


}