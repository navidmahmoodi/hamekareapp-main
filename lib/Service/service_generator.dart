import 'package:dio/dio.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GET;
import 'package:hamekare_app/Config/server_config.dart';
import 'package:hamekare_app/Model/category_model.dart';
import 'package:hamekare_app/Model/get_subcity.dart';
import 'package:hamekare_app/Model/profile_model.dart';
import 'package:hamekare_app/Model/darkhast_model.dart';
import 'package:hamekare_app/Model/get_city_model.dart';
import 'package:hamekare_app/Model/get_darkhast_model.dart';
import 'package:hamekare_app/Model/register_model.dart';
import 'package:hamekare_app/Model/response_model.dart';
import 'package:hamekare_app/Model/check_otp_model.dart';
import 'package:hamekare_app/Model/login_model.dart';
import 'package:hamekare_app/Model/service_model.dart';
import 'package:hamekare_app/Model/splash_model.dart';
import 'package:hamekare_app/Service/error.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/response/slider_response.dart';
import 'package:hamekare_app/tools/logger.dart';
import 'package:image_picker/image_picker.dart';
import '../Service/logging_interceptor.dart';

final _mainController = GET.Get.put(MainController());

class ServiceGenerator {
  Dio _dio = Dio();
  var msg = "بروز خطا";

  updateDio(Map<String, String> header) {
    BaseOptions options = BaseOptions(
      headers: header,
      baseUrl: ServerConfig.url,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      // contentType: ContentType.json.toString(),
    );
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  ResponseModel _getError<T>(dynamic error) {
    if (error is DioException) {
      DioException e = error;
      return ResponseModel(
          status: false,
          errorCode: e.response?.statusCode ?? 0,
          message: handleError(error));
    } else {
      return ResponseModel(status: false, errorCode: 0, message: msg);
    }
  }

  Future<SplashModel> getSplash() async {
    try {
      Response response = await _dio.get(ServerConfig.splash);
      return SplashModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return SplashModel.withError(_getError(error).toJson());
    }
  }

  Future<CategoryResponse> getCategory(String token) async {
    try {
      Response response = await _dio.get(ServerConfig.getCategory,
          data: {"branch_id": _mainController.cityid});
      return CategoryResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return CategoryResponse.withError(_getError(error).toJson());
    }
  }

  Future<ServiceResponse> getServices(int id) async {
    try {
      Response response = await _dio
          .get(ServerConfig.urlGetServices, data: {"subcategory_id": id});
      return ServiceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ServiceResponse.withError(_getError(error).toJson());
    }
  }

  Future<SliderResponse> getSlider() async {
    try {
      Response response = await _dio.get(ServerConfig.getSlider);
      return SliderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return SliderResponse.withError(_getError(error).toJson());
    }
  }

  Future<LoginModel> postLogin(String phone, String password) async {
    try {
      Response response = await _dio.post(ServerConfig.login,
          data: {"mobile": phone, "password": password});
      return LoginModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return LoginModel.withError(_getError(error));
    }
  }

  Future<ResponseModel> reqOtp() async {
    try {
      Response response = await _dio.post(ServerConfig.reqotp);
      return ResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withError(_getError(error).toJson());
    }
  }

  Future<OtpModel> postOtp(String phone, String otp) async {
    try {
      Response response = await _dio
          .post(ServerConfig.otp, data: {"mobile": phone, "otp": otp});
      return OtpModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return OtpModel.withError(_getError(error).toJson());
    }
  }

  Future<RegisterModel> postSignUp(String firstname, String lastname,
      String email, String mobile, String password, String username) async {
    // Map<String, dynamic> body = {'expert': jsonEncode(data)};
    // print(body);
    try {
      var params = {
        "first_name": firstname,
        "last_name": lastname,
        "contact_number": mobile,
        "username": username,
        "password": password
      };

      if (email.isNotEmpty) {
        params.addAll({
          "email": email,
        });
      }

      Response response = await _dio.post(ServerConfig.register,
          // data: body,
          // options: Options(contentType: Headers.formUrlEncodedContentType)
          data: params);
      return RegisterModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return RegisterModel.withError(_getError(error).toJson());
    }
  }

  Future<GetCityModel> getCity() async {
    try {
      Response response =
          await _dio.post(ServerConfig.getCity, data: {"country_id": 103});
      return GetCityModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return GetCityModel.withError(_getError(error).toJson());
    }
  }

  Future<GetSubCityModel> getSubCity(int id) async {
    try {
      Response response =
          await _dio.post(ServerConfig.getSubCity, data: {"state_id": id});
      return GetSubCityModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return GetSubCityModel.withError(_getError(error).toJson());
    }
  }

  Future<ProfileResponse> postCity(int id) async {
    try {
      Response response =
          await _dio.post(ServerConfig.postCity, data: {"city_id": id});
      return ProfileResponse.fromJson(
        response.data,
      );
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ProfileResponse.withError(_getError(error).toJson());
    }
  }

  // Future<SplashModel> splash(String token, int appId) async {
  //   try {
  //     Response response = await _dio
  //         .post(ServerConfig.urlSplash, data: {"Token": token, "AppID": appId});
  //     return SplashModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
  //     return SplashModel.withError(_getError(error).toJson());
  //   }
  // }

  // Future<ResponseModel> rateReqApp(String content, int id, int rate) async {
  //   try {
  //     Response response = await _dio.post(ServerConfig.urlRateReq,
  //         data: {"Content": content, "DarkhastID": id, "Star": rate});
  //     return ResponseModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
  //     return ResponseModel.withError(_getError(error).toJson());
  //   }
  // }

  // Future<ResponseModel> postCancel(int id) async {
  //   try {
  //     Response response =
  //         await _dio.post(ServerConfig.urlCancelReq, data: {"ID": id});
  //     return ResponseModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
  //     return ResponseModel.withError(_getError(error).toJson());
  //   }
  // }

  Future<ResponseModel> postProfile(String name, String fname, String dname,
      String email, String addres, XFile? file) async {
    try {
      Map<String, dynamic> formData = {
        "first_name": name,
        "last_name": fname,
        "display_name": dname,
        "email": email,
        "address": addres
      };

      if (file != null) {
        formData.addAll({
          "profile_image":
              await MultipartFile.fromFile(file.path, filename: file.name)
        });
      }

      var param = FormData.fromMap(formData);

      Response response = await _dio.post(
        ServerConfig.profile,
        data: param,
      );

      return ResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withError(_getError(error).toJson());
    }
  }

  // Future<ResponseModel> postImage() async {
  //   final _controller = GET.Get.put(ProfileResponse());

  //   FormData formData = FormData.fromMap({
  //     "profile_image": await MultipartFile.fromFile(_controller.image!.path,
  //         filename: "fileName"),
  //   });

  //   try {
  //     Response response = await _dio.post(
  //       ServerConfig.profile,
  //       data: formData,
  //     );
  //     return ResponseModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
  //     return ResponseModel.withError(_getError(error).toJson());
  //   }
  // }

  Future<ProfileResponse> getProfile() async {
    try {
      Response response = await _dio.post(ServerConfig.profile);
      return ProfileResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ProfileResponse.withError(_getError(error).toJson());
    }
  }

  Future<PostDarkhast> postDarkhast(
    String date,
    String address,
    String desc,
    int id,
    int providerID,
  ) async {
    try {
      Response response = await _dio.post(ServerConfig.postBooking, data: {
        "date": date,
        "address": address,
        "description": desc,
        "service_id": id,
        "provider_id": providerID,
      });
      // print(response);
      return PostDarkhast.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return PostDarkhast.withError(_getError(error).toJson());
    }
  }

  Future<GetDarkhastResponse> getDarkhsat() async {
    try {
      Response response = await _dio.get(ServerConfig.getDartkhast);
      return GetDarkhastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return GetDarkhastResponse.withError(_getError(error).toJson());
    }
  }

  // Future<ResponseModel> requestPay(int id) async {
  //   try {
  //     Response response =
  //         await _dio.post(ServerConfig.urlRequestPay, data: {"ID": id});
  //     return ResponseModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
  //     return ResponseModel.withError(_getError(error).toJson());
  //   }
  // }
  Future<ResponseModel> changePassword(String old, String neww) async {
    try {
      Response response = await _dio.post(ServerConfig.changePassword,
          data: {"old_password": old, "new_password": neww});
      return ResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withError(_getError(error).toJson());
    }
  }

  Future<ResponseModel> rateReqApp(param) async {
    try {
      Response response =
          await _dio.post(ServerConfig.urlPostRating, data: param);
      return ResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withError(_getError(error).toJson());
    }
  }

  Future<ResponseModel> updateDarkhsat(int id, String status) async {
    try {
      Response response = await _dio.post(ServerConfig.updateDartkhast,
          data: {"id": id, "status": status, "payment_status": ""});
      return ResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withError(_getError(error).toJson());
    }
  }
  // Future<void> getDarkhast(String token){
  //   try {

  //   } catch (error,stacktrace) {
  //     loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
  //     return
  //   }
  // }
}
