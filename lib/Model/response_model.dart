class BaseResponseModel {
  String message;
  bool status;
  bool isloading;

  BaseResponseModel({
    this.message = "",
    this.status = false,
    this.isloading = false,
  });
  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
        status: json["status"],
        message: json["message"],);
  }
}

class ResponseModel extends BaseResponseModel {
  ResponseModel({
    message = "",
    status = false,
    errorCode = 200,
    isloading = false,
  });
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        status: json["status"],
        message: json["message"],
        errorCode: json["errorCode"]);
  }
  factory ResponseModel.withError(Map<String, dynamic> json) {
    return ResponseModel(
      status: json["status"],
      message: json["message"],
    );
  }
  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
