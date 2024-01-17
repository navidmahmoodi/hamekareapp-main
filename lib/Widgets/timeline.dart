import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamekare_app/Model/timelinemodel.dart';
import 'package:hamekare_app/controller/reserve_controller.dart';

class TimeLine extends StatelessWidget {
  TimeLine({Key? key}) : super(key: key);

  final _controller = PageController();
  final ReserveController dayController = Get.find();
  List<TimeLineModel> get _list => dayController.timeLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
              icon: const Icon(Icons.arrow_back_outlined)),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 30,
                // width: 300,
                child: PageView.builder(
                    controller: _controller,
                    pageSnapping: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: _list.length,
                    onPageChanged: (i) {
                      dayController.changeTime(i);
                    },
                    itemBuilder: (c,i) {
                      var nvid = _list[i];
                      return Text(nvid.time, textAlign: TextAlign.center);
                    }),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                _controller.nextPage(
                    duration: const Duration(milliseconds: 200), 
                    curve: Curves.easeIn);
              },
              icon: const Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}
