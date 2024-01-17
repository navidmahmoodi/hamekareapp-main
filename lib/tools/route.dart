import 'package:get/get.dart';

void navigateToPushReplacement(String screen, dynamic argument,
    {bool preventDuplicates = true}) {
  Get.offNamed(screen,
      arguments: argument, preventDuplicates: preventDuplicates);
}

void navigateToPush(String screen, dynamic argument, Function? then,
    {bool preventDuplicates = true}) {
  Get.toNamed(screen,
      arguments: argument, preventDuplicates: preventDuplicates);
}

void navigatePop(dynamic data) {
  Get.back(result: data);
}

void navigateToPushAndRemoveUntil(String screen, dynamic argument) {
  Get.offAllNamed(screen, arguments: argument);
}
