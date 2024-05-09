import 'dart:convert';

import 'package:smart_home/mvp/mvp_presenter.dart';
import 'package:flutter/cupertino.dart';
import '../../../../model/adafruit_server.dart';
import '../../../../model/network/http_help.dart';
import 'led_view.dart';

LedPresenter ledPresenter = LedPresenter();

class LedPresenter extends MvpPresenter<LedView> {
  bool led = false;

  Future LedOnPressed (BuildContext context) async{
    if (led) {
      adafruitServer.mqttHelp.publish('datpham0411/feeds/den', '1');
    }
    else {
      adafruitServer.mqttHelp.publish('datpham0411/feeds/den', '0');
    }
  }

  Future<void> getValue(int value) async {
    getView().updateData(value);
    // checkViewAttached();
    // Future.delayed(const Duration(seconds: 5));
    // String url = "https://io.adafruit.com/api/v2/datpham0411/feeds/den";
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
