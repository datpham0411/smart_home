import 'dart:convert';

import 'package:smart_home/home_page/dashboard_box/button_box/pump/pump_view.dart';
import 'package:smart_home/mvp/mvp_presenter.dart';
import 'package:smart_home/mvp/mvp_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../model/adafruit_server.dart';
import '../../../../model/network/http_help.dart';

PumpPresenter pumpPresenter = PumpPresenter();

class PumpPresenter extends MvpPresenter<PumpView> {
  bool pump = false;

  Future PumpOnPressed (BuildContext context) async {
    if (pump) {
      adafruitServer.mqttHelp.publish('datpham0411/feeds/bom', '1');
    }
    else {
      adafruitServer.mqttHelp.publish('datpham0411/feeds/bom', '0');
    }
  }

  Future<void> getValue(int value) async {
    getView().updateData(value);
    // checkViewAttached();
    // Future.delayed(const Duration(seconds: 5));
    // String url = "https://io.adafruit.com/api/v2/datpham0411/feeds/bom";
    // var response = await adafruitServer.httpHelper.fetchText(url);
    // if (NetworkUtils.isReqSuccess(response)) {
    //   String text = response.body;
    //   final jsonData = await jsonDecode(text);
    //   final val = jsonData["last_value"];
    //   isViewAttached ? getView().updateData(int.parse(val)) : null;
    // }
    // else {
    //   isViewAttached ? getView().onFailLoadUpdate() : null;
    // }
  }
}
