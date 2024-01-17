class BaseResponseModel {
  String message;
  bool status;
  bool isloading;
  int errorCode = 0;
  bool isLoading = false;

  BaseResponseModel({
    this.message = "",
    this.status = false,
    this.isloading = false,
  });
  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

class ResponseModel extends BaseResponseModel {
  ResponseModel({
    bool status = false,
    String message = "",
    int errorCode = 0,
    bool isLoading = false,
  }) {
    this.status = status;
    this.message = message;
    this.errorCode = errorCode;
    this.isLoading = isLoading;
  }

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        status: json["status"] ?? true,
        message: json["message"],
        errorCode: json["errorCode"] ?? 200);
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
