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
  int get day => reserveModel.value.selectedDay + 1;

  final DateTime now = DateTime.now();
  DateTime get selectedDateTime => DateTime(now.year, now.month, now.day)
      .add(Duration(days: day, hours: selectedTime.hour));

  TimeLineModel get selectedTime => timeLine[selectedTimeIndex.value];

  bool isCurrentDay(index) => reserveModel.value.selectedDay == index;

  List<TimeLineModel> timeLine = [
    TimeLineModel(time: "ساعت 6 الی 8".withPersianNumbers(), hour: 6),
    TimeLineModel(time: "ساعت 8 الی 10".withPersianNumbers(), hour: 8),
    TimeLineModel(time: "ساعت 10 الی 12".withPersianNumbers(), hour: 10),
    TimeLineModel(time: "ساعت 12 الی 14".withPersianNumbers(), hour: 12),
    TimeLineModel(time: "ساعت 14 الی 16".withPersianNumbers(), hour: 14),
    TimeLineModel(time: "ساعت 16 الی 18".withPersianNumbers(), hour: 16),
    TimeLineModel(time: "ساعت 18 الی 20".withPersianNumbers(), hour: 18),
    TimeLineModel(time: "ساعت 20 الی 22".withPersianNumbers(), hour: 20),
    TimeLineModel(time: "ساعت 22 الی 00".withPersianNumbers(), hour: 22),
  ];
}

class ReserveModel {
  int selectedDay = -1;
}
