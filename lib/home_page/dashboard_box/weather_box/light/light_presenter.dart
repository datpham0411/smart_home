

import 'dart:convert';

import 'package:smart_home/model/adafruit_server.dart';
import 'package:smart_home/mvp/mvp_presenter.dart';

import '../../../../model/network/http_help.dart';
import 'light_view.dart';

LightPresenter lightPresenter = LightPresenter();

class LightPresenter extends MvpPresenter<LightView>{
  Future<void> getValue(double value) async {
    getView().updateData(value);
  }

  // Future<void> getValue() async {
  //   checkViewAttached();
  //   Future.delayed(const Duration(seconds: 5));
  //   String url = "https://io.adafruit.com/api/v2/datpham0411/feeds/anhsang";
  //   var response = await adafruitServer.httpHelper.fetchText(url);
  //   if (NetworkUtils.isReqSuccess(response)) {
  //     String text = response.body;
  //     final jsonData = await jsonDecode(jsonDecode(text)["last_value"]);
  //     final val = jsonData["light"];
  //     isViewAttached ? getView().updateData(val) : null;
  //   }
  //   else {
  //     isViewAttached ? getView().onFailLoadUpdate() : null;
  //   }
  // }
}