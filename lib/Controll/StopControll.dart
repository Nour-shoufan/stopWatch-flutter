import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ClockModel.dart';
import 'package:get/get.dart';

abstract class StopWatch extends GetxController {
  pause();
  start();
  restart();
  updateTime(Timer times);
  TakeClock();


}

class StopWatchImp extends StopWatch {
  List<Clock> clocks = <Clock>[

  ];
  bool status = false;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  // Duration Seconds = Duration(seconds: 0);
  Duration clockTimer = Duration(seconds: 1);
  late Timer FuctionRepated;

  @override
  pause() {
    status = false;
    if (FuctionRepated.isActive) {
      FuctionRepated.cancel();
    }
    update();
  }

  @override
  restart() {
    FuctionRepated.cancel();
    minutes = 0;
    hours = 0;
    seconds = 0;

    start();

    update();
  }

  @override
  start() {
    status = true;

    FuctionRepated = Timer.periodic(clockTimer, updateTime);

    update();
  }

  @override
  void updateTime(Timer times) {
    // الغلط انو اجمع مدة مع مدة بيعطي بطأ
    // clockTimer += Seconds;
    seconds++;
    hours = clockTimer.inHours.remainder(24);
    minutes = clockTimer.inHours.remainder(60);
    seconds = seconds.remainder(60);
    update();
    // if (seconds == 60) {
    //   minutes++;
    //   if (minutes == 60) {
    //     minutes = 0;
    //     hours++;
    //   }
    // }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    FuctionRepated.cancel();
    super.dispose();
  }

  @override
  TakeClock() {
    clocks.add(Clock(hours: hours, minutes: minutes, second: seconds));
    update();
  }
}
