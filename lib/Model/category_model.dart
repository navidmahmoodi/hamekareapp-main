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
   this.id,
   this.name,
   this.categoryImage,
  required this.subCategories,
  });
  late int? id;
  late String? name;
  late String? categoryImage;
  late List<SubCategories> subCategories;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    categoryImage = json['category_image'];
    subCategories = List.from(json['sub_categories']).map((e)=>SubCategories.fromJson(e)).toList();
  }


}

class SubCategories {
  SubCategories({
    this.id,
    this.categoryId,
    this.name,
  });
  late int? id;
  late int? categoryId;
  late String? name;
  late String? categoryImage;
  
  SubCategories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    categoryImage = json['category_image'];
  }


}