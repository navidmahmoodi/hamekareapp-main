class SliderModel {
  int? sliderID;
  String? sliderTitle;
  String? sliderPrice;
  String? sliderPic;
  String? city;

  SliderModel({
    this.sliderID,
    this.sliderTitle,
    this.sliderPrice,
    this.sliderPic,
    this.city
  });

  SliderModel.fromJson(Map<String, dynamic> json) {
    sliderID = json['ID'];
    sliderTitle = json['Title'];
    sliderPrice = json['Coust'];
    sliderPic = json['Pic'];
    city = json["City"];
  }

}
