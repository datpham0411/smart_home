

import 'dart:async';
import 'dart:convert';

import 'package:smart_home/model/adafruit_server.dart';
import 'package:smart_home/mvp/mvp_presenter.dart';
import '../../../../model/network/http_help.dart';
import 'temperature_view.dart';

TemperaturePresenter temperaturePresenter = TemperaturePresenter();

class TemperaturePresenter extends MvpPresenter<TemperatureView> {

    Future<void> getValue(double value) async {
      checkViewAttached();
      // Future.delayed(const Duration(seconds: 5));
      // String url = "https://io.adafruit.com/api/v2/datpham0411/feeds/nhietdo";
      // var response = await adafruitServer.httpHelper.fetchText(url);
      // if (NetworkUtils.isReqSuccess(response)) {
      //   String text = response.body;
      //   final jsonData = await jsonDecode(jsonDecode(text)["last_value"]);
      //   final val = jsonData["temp"];
      getView().updateData(value);
        // isViewAttached ? getView().updateData(value) : null;
      // }
      // else {
      //   isViewAttached ? getView().onFailLoadUpdate() : null;
      // }
    }
}