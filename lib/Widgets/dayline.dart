import 'package:flutter/material.dart';
import 'package:hamekare_app/controller/reserve_controller.dart';
import 'package:hamekare_app/tools/tools.dart';
import 'package:get/get.dart';
import 'package:persian/persian.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DayLine extends StatelessWidget {
  DayLine({
    Key? key,
  }) : super(key: key);
  final ReserveController dayController = Get.find();

  Widget dayBox(int dayOfMonth, int weekDay, int index) {
    return Column(
      children: [
        Text(
          getWDbyIndex(weekDay),
          style: TextStyle(color: MyThemes.primaryColor),
        ),
        Text(
          (dayOfMonth).toString().withPersianNumbers(),
          style: TextStyle(color: MyThemes.primaryColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var date = Jalali.now();

    var size = Get.size;
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      child: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: dayController.isCurrentDay(i)
                        ? MyThemes.settingGrey
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    dayController.changeDay(i);


                    print(date.addDays(i).cDate(7));
                  },
                  child: Container(
                    child:
                        dayBox(date.addDays(i).day, date.addDays(i).weekDay, i),
                  ),
                ),
              );
            });
          }),
    );
  }
}
