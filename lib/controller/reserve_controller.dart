import 'package:get/get.dart';
import 'package:hamekare_app/Model/timelinemodel.dart';
import 'package:persian/persian.dart';

class ReserveController extends GetxController {
  final reserveModel = ReserveModel().obs;
  var selectedTimeIndex = 0.obs;

  changeDay(int index) {
    reserveModel.update((val) => val!.selectedDay = index);
  }

  changeTime(int i) {
    selectedTimeIndex.value = i;
  }

// .update((val) => val != i);
  int get day => reserveModel.value.selectedDay;
  String get selectedTime => timeLine[selectedTimeIndex.value].time;

  bool isCurrentDay(index) => reserveModel.value.selectedDay == index;

  List<TimeLineModel> timeLine = [
    TimeLineModel(time: "ساعت 6 الی 8".withPersianNumbers()),
    TimeLineModel(time: "ساعت 8 الی 10".withPersianNumbers()),
    TimeLineModel(time: "ساعت 10 الی 12".withPersianNumbers()),
    TimeLineModel(time: "ساعت 12 الی 14".withPersianNumbers()),
    TimeLineModel(time: "ساعت 14 الی 16".withPersianNumbers()),
    TimeLineModel(time: "ساعت 16 الی 18".withPersianNumbers()),
    TimeLineModel(time: "ساعت 18 الی 20".withPersianNumbers()),
    TimeLineModel(time: "ساعت 20 الی 22".withPersianNumbers()),
    TimeLineModel(time: "ساعت 22 الی 00".withPersianNumbers()),
  ];
}

class ReserveModel {
  int selectedDay = -1;
}
