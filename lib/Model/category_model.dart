import 'package:hamekare_app/Model/response_model.dart';

class CategoryResponse extends BaseResponseModel {
  CategoryResponse({this.data});
  late List<CategoryModel>? data;

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = List.from(json['data'])
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    }
  }

  factory CategoryResponse.withError(Map<String, dynamic> json) {
    CategoryResponse item = CategoryResponse();
    item.status = json["status"];
    item.message = json["message"];
    return item;
  }
}

class CategoryModel {
  CategoryModel({
    this.id = 0,
    this.name,
    this.categoryImage,
    required this.subCategories,
  });
  late int id;
  late String? name;
  late String? categoryImage;
  late List<SubCategories> subCategories;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryImage = json['category_image'];
    subCategories = List.from(json['sub_categories'])
        .map((e) => SubCategories.fromJson(e))
        .toList();
    subCategories.insert(
        0,
        SubCategories(
          id: id,
          name: "همه",
          categoryId: id,
          selected: true,
        ));
  }
}

class SubCategories {
  SubCategories({
    this.id = 0,
    this.categoryId,
    this.name,
    this.selected = false,
  });

  int id = 0;
  int? categoryId;
  String? name;
  String? categoryImage;
  bool selected = false;

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    categoryImage = json['category_image'];
  }
}
