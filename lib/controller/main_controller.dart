import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/category_model.dart';
import 'package:hamekare_app/Model/profile_model.dart';
import 'package:hamekare_app/Service/service_generator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  // final _profileResponse = ProfileResponse().obs;
  // ProfileResponse get profileResponse => _profileResponse.value;

  // Future<ProfileResponse> getProfile() async{

  // }
  // .........................................................

  late SharedPreferences prefs;
  String token = "";
  int cityid = 1;
  String cityname = "";
  bool isInit = false, isInitRunning = false;

  bool isUserLogin() {
    return !(token == "");
  }

  var headers = {
    "accept": 'application/json',
    "content-type": 'application/json; charset=UTF-8',
  }.obs;

  var api = ServiceGenerator();
  init() async {
    if (isInitRunning) return false;
    if (isInit) return isInit;
    isInitRunning = true;

    prefs = await SharedPreferences.getInstance();
    // await prefs.reload();
    api.updateDio(headers);
    initToken();

    isInit = true;
    isInitRunning = false;
  }

  final _categoryResponse = CategoryModel().obs;
  CategoryModel get categoryResponse => _categoryResponse.value;

  Future<CategoryModel> getCategory() async {
    _categoryResponse.update((val) {
      val!.isloading = true;
    });
    _categoryResponse.value = await api.getCategory(token);
    _categoryResponse.update((val) {
      val!.isloading = false;
    });
    return _categoryResponse.value;
  }

  //Profile
  final _profileResponse = ProfileResponse().obs;
  ProfileResponse get profileResponse => _profileResponse.value;

  set profileImage(XFile? v) =>
      _profileResponse.update((val) => val!.image = v);

  Future<ProfileResponse> postPofile(String name, String fname, String dname,
      String email, String addres) async {
    _profileResponse.update((val) {
      val!.isloading = true;
    });

    await api.postProfile(name, fname, dname, email, addres);

    _profileResponse.update((val) {
      val!.isloading = false;
    });
    return _profileResponse.value;
  }

  ImageProvider<Object> get selectedImage {
    var item = profileResponse.data;
    if (profileResponse.image == null) {
      return NetworkImage(item!.profileImage.toString());
    } else {
      return FileImage(File(profileResponse.image!.path));
    }
  }

  Future imagefromgallery() async {
    profileImage = await getImage();
  }

  Future<XFile?> getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    var result = await Get.defaultDialog(
      title: "انتخاب عکس",
      content: Column(
        children: [
          ListTile(
            title: const Text("گالری"),
            leading: const Icon(Icons.photo),
            onTap: () => Get.back(result: 1),
          ),
          ListTile(
            title: const Text("دوربین"),
            leading: const Icon(Icons.photo_camera),
            onTap: () => Get.back(result: 2),
          ),
        ],
      ),
    );
    if (result is int) {
      if (result == 1) {
        return imagePicker.pickImage(source: ImageSource.gallery);
      } else {
        return imagePicker.pickImage(source: ImageSource.camera);
      }
    }
    return null;
  }

  Future<ProfileResponse> getProfile() async {
    _profileResponse.update((val) {
      val!.isloading = true;
    });
    _profileResponse.value = await api.getProfile();
    _profileResponse.update((val) {
      val!.isloading = false;
    });
    return _profileResponse.value;
  }

  @override
  onInit() {
    super.onInit();
    ever(headers, (Map<String, String> val) {
      api.updateDio(val);
    });
  }

  initToken() {
    token = prefs.getString("token") ?? "";
    headers["Authorization"] = token;
    cityid = prefs.getInt("cityid") ?? 1;
    cityname = prefs.getString("cityname") ?? "1";
    setToken(token);
  }

  setCityid(int t) async {
    cityid = t;
    await prefs.setInt("cityid", t);
  }

  setCityName(String t) async {
    cityname = t;
    await prefs.setString("cityname", t);
  }

  setToken(String t) async {
    token = t;
    await prefs.setString("token", t);
    headers["Authorization"] = "Bearer $t";
    headers["token"] = t;
  }

  bool showIntro() {
    return prefs.getBool("intro") ?? true;
  }

  Future doneIntro() async {
    await prefs.setBool("intro", false);
  }
}
