
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:smart_home/home_page/home_page.dart';
import 'package:smart_home/main_screen.dart';
import 'package:smart_home/my_share/user.dart';
import 'package:smart_home/home_page/task_box/task_box.dart';
import 'package:smart_home/home_page/task_box/task_box_presenter.dart';
import 'package:smart_home/home_page/tool_bar/tool_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../../model/adafruit_server.dart';
import '../../model/network/mqtt_help.dart';
import '../../mvp/mvp_presenter.dart';

ToolBarPresenter toolBarPresenter = ToolBarPresenter();

class ToolBarPresenter extends MvpPresenter<ToolBarView> {
  AdafruitServer adafruitServer = AdafruitServer();
  late TaskBoxPresenter _taskboxpresenter = taskBoxPresenter;

  void getStatus(){
    checkViewAttached();
    bool status = adafruitServer.isConnected();
    isViewAttached ? getView().setStatus(status) : null;
  }

  Future serverOnPressed(BuildContext context) async => showCupertinoDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                child: Container(
                  color: Colors.transparent.withOpacity(0.15),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    title: Text("Adafruit Account", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: const InputDecoration(hintText: "User"),
                          controller: _taskboxpresenter.userController,
                        ),
                        TextField(
                          decoration: const InputDecoration(hintText: "Key"),
                          controller: _taskboxpresenter.keyController,
                        )
                      ],
                    ),
                    actions: [
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent.withOpacity(0.7),
                        ),
                        child:  TextButton(onPressed: () {reconnect(context);},
                            child: const Text("Connect", style: TextStyle(color: Colors.black, fontSize: 20))
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        );
      });
  Future reconnect(BuildContext context)async {
    adafruitServer.mqttHelp.userName = _taskboxpresenter.userController.text;
    adafruitServer.mqttHelp.password = _taskboxpresenter.keyController.text;
    adafruitServer.mqttHelp.connect();
    Navigator.of(context).pop();
    _taskboxpresenter.userController.clear();
    _taskboxpresenter.keyController.clear();
  }



}