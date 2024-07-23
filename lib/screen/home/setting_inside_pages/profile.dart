import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/profile_model.dart';
import 'package:hamekare_app/controller/main_controller.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persian/persian.dart';

class ProfileScreen extends StatelessWidget {
  final MainController _controller = Get.find();

  final namecontroller = TextEditingController();
  final fnamecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final mailcontroller = TextEditingController();
  final addrescontroller = TextEditingController();

  ProfileScreen({super.key});
  ProfileModel get profile => _controller.profileResponse.data!;

  init() {
    namecontroller.text = profile.firstName.toString();
    fnamecontroller.text = profile.lastName.toString();
    mobilecontroller.text =
        profile.contactNumber.toString().withPersianLetters();
    mailcontroller.text = profile.email.toString();
    addrescontroller.text = profile.address.toString();
  }

  Widget _textField(
      {required TextEditingController controller,
      required String title,
      int? maxLength,
      bool? enabled,
      required TextAlign direction,
      TextInputType? type,
      int? maxLines}) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: MyThemes.grey),
          ),
          TextField(
            maxLines: maxLines,
            controller: controller,
            cursorColor: MyThemes.primaryColor,
            textAlign: direction,
            enabled: enabled,
            keyboardType: type,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
              FilteringTextInputFormatter.deny(RegExp(r"\n"))
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: MyThemes.secondryColor, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: MyThemes.secondryColor.withOpacity(0.75),
                    width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> checkGalleryPermission(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    Map<Permission, PermissionStatus> statues = await [
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    PermissionStatus? statusStorage = statues[Permission.storage];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted &&
        statusStorage == PermissionStatus.granted &&
        statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      //openCameraGallery();
      //_openDialog(context);
    }
    bool isPermanentlyDenied =
        statusCamera == PermissionStatus.permanentlyDenied ||
            statusStorage == PermissionStatus.permanentlyDenied ||
            statusPhotos == PermissionStatus.permanentlyDenied;
    return !isPermanentlyDenied;
    // if (isPermanentlyDenied) {
    //   // showSettingsDialog(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.1,
              blurRadius: 4,
            ),
          ]),
          child: ElevatedButton(
            onPressed: () async {
              // await _controller.api.postImage();

              await _controller.postPofile(
                namecontroller.text,
                fnamecontroller.text,
                mailcontroller.text,
                addrescontroller.text
              );
              if (!_controller.profileResponse.status) {
                _controller.getProfile();
                Get.back();
              }
              ShowMSG().showSnackBar("اطلاعات شما با موفقیت ثبت شد");
            },
            style: ButtonStyle(
              shadowColor: WidgetStateProperty.all(MyThemes.primaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: MyThemes.primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor:
                  WidgetStateProperty.all(MyThemes.secondryColor),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'تایید',
                style: TextStyle(color: MyThemes.primaryColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: MyThemes.secondryColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              splashColor: MyThemes.primaryColor,
              splashRadius: 22,
              onPressed: (() => Get.back()),
              icon: const Icon(Icons.arrow_forward),
              color: MyThemes.primaryColor),
        ],
        title: Text(
          "اطلاعات کاربری",
          style: TextStyle(color: MyThemes.primaryColor),
        ),
        backgroundColor: MyThemes.secondryColor,
      ),
      body: Obx(() {
        if (_controller.profileResponse.isloading) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: simpleLoading());
        }
        return ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 35, bottom: 20),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: MyThemes.primaryColor, width: 1.5),
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _controller.selectedImage,
                    ),
                  ),
                ),
                Positioned(
                  right: 125,
                  bottom: 15,
                  child: FloatingActionButton(
                    splashColor: MyThemes.primaryColor,
                    backgroundColor: MyThemes.secondryColor,
                    onPressed: () async {
                      if (await checkGalleryPermission(context)) {
                        _controller.imagefromgallery();
                      }
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: MyThemes.primaryColor,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _textField(
                      direction: TextAlign.right,
                      controller: namecontroller,
                      title: "نام"),
                  _textField(
                      direction: TextAlign.right,
                      controller: fnamecontroller,
                      title: "نام خانوادگی"),
                  _textField(
                      controller: mobilecontroller,
                      title: "شماره موبایل",
                      enabled: false,
                      direction: TextAlign.left,
                      type: TextInputType.number),
                  _textField(
                      direction: TextAlign.right,
                      controller: mailcontroller,
                      title: "پست الکترونیک"),
                  _textField(
                      direction: TextAlign.right,
                      controller: addrescontroller,
                      title: "آدرس",
                      maxLines: 4),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
