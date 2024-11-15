// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controll/StopControll.dart';
import 'package:get/get.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    StopWatchImp control = Get.put(StopWatchImp());
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "StopWatch.App",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          GetBuilder<StopWatchImp>(
            builder: (controller) {
              return Text(
                '${controller.hours.toString().padLeft(2, "0")}:${controller.minutes.toString().padLeft(2, "0")}:${controller.seconds.toString().padLeft(2, "0")}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 350,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(204, 200, 200, 1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: GetBuilder<StopWatchImp>(
                    builder: (controller) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 9),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: control.clocks.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(204, 200, 200, 1)
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Lab${index + 1}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "        ${control.clocks[index].hours.toString().padLeft(2, "0")} : ${control.clocks[index].minutes.toString().padLeft(2, "0")} : ${control.clocks[index].second.toString().padLeft(2, "0")} ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GetBuilder<StopWatchImp>(
                    builder: (controller) {
                      return MaterialButton(
                          onPressed: () {
                            control.status == false
                                ? control.start()
                                : control.pause();
                          },
                          color: Colors.red,
                          child: control.status == false
                              ? Text(
                                  "start",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              : Text(
                                  "Pasue",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ));
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        control.TakeClock();
                      },
                      icon: Icon(
                        Icons.fiber_smart_record,
                        color: Colors.white,
                        size: 40,
                      )),
                  MaterialButton(
                    onPressed: () {
                      control.restart();
                    },
                    color: Colors.red,
                    child: Text(
                      "Restart",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
