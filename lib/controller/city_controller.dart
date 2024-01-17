
import 'package:get/get.dart';
import 'package:hamekare_app/Model/get_city_model.dart';
import 'package:hamekare_app/Model/get_subcity.dart';
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

    print(getcityModel.message);
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

    print(getSubcityModel.message);
    _getSubcityModel.update((val) {
      val!.isloading = false;
    });

    return _getSubcityModel.value;
  }



  // void updateExpanded(int i, bool isExpanded) {
  //   _getcityModel.update((val) {
  //     val!.result.forEach((e) => e.isExpanded = false);
  //     val.result[i].isExpanded = isExpanded;
  //   });
  // }
}
