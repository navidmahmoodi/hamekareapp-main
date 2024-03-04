
import 'package:get/get.dart';
import 'package:hamekare_app/Model/get_city_model.dart';
import 'package:hamekare_app/Model/get_subcity.dart';
import 'package:hamekare_app/Model/profile_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';

class CityController extends GetxController {
  final _getcityModel = GetCityModel().obs;
  GetCityModel get getcityModel => _getcityModel.value;
  final _getSubcityModel = GetSubCityModel().obs;
  GetSubCityModel get getSubcityModel => _getSubcityModel.value;
  final MainController _mainController = Get.find();

    Future<GetCityModel> getCity() async {
    _getcityModel.update((val) {
      val!.isloading = true;
    });

    _getcityModel.value = await _mainController.api.getCity();

    _getcityModel.update((val) {
      val!.isloading = false;
    });

    return _getcityModel.value;
  }
  Future<GetSubCityModel> getSubCity(int id) async {
    _getSubcityModel.update((val) {
      val!.isloading = true;
    });

    _getSubcityModel.value = await _mainController.api.getSubCity(id);

    _getSubcityModel.update((val) {
      val!.isloading = false;
    });

    return _getSubcityModel.value;
  }

  final _postCityResponse = ProfileResponse().obs;
  ProfileResponse get postcityResponse => _postCityResponse.value;



  Future<ProfileResponse> postCity(int city) async {
    _postCityResponse.update((val) {
      val!.isloading = true;
    });

  _postCityResponse.value =  await _mainController.api.postCity(city);

    _postCityResponse.update((val) {
      val!.isloading = false;
    });
    return _postCityResponse.value;
  }

  // void updateExpanded(int i, bool isExpanded) {
  //   _getcityModel.update((val) {
  //     val!.result.forEach((e) => e.isExpanded = false);
  //     val.result[i].isExpanded = isExpanded;
  //   });
  // }
}
