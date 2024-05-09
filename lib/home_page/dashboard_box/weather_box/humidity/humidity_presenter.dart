import 'dart:convert';
import 'package:smart_home/model/adafruit_server.dart';

import '../../../../model/network/http_help.dart';
import '../../../../mvp/mvp_presenter.dart';
import 'humidity_view.dart';

HumidityPresenter humidityPresenter = HumidityPresenter();

class HumidityPresenter extends MvpPresenter<HumidityView>{
  Future<void> getValue(double value) async {
    getView().updateData(value);
  }
  // void changeValue(double val){
  //   checkViewAttached();
  //   isViewAttached ? getView().updateData(val) : null;
  // }
  // Future<void> getValue() async {
  //   checkViewAttached();
  //   Future.delayed(const Duration(seconds: 5));
  //   String url = "https://io.adafruit.com/api/v2/datpham0411/feeds/doam";
  //   var response = await adafruitServer.httpHelper.fetchText(url);
  //   if (NetworkUtils.isReqSuccess(response)) {
  //     String text = response.body;
  //     final jsonData = await jsonDecode(jsonDecode(text)["last_value"]);
  //     final val = jsonData["humid"];
  //     isViewAttached ? getView().updateData(val) : null;
  //   }
  //   else {
  //     isViewAttached ? getView().onFailLoadUpdate() : null;
  //   }
  // }
}