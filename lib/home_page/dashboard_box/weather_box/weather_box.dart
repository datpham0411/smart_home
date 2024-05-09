
import 'package:smart_home/home_page/dashboard_box/weather_box/humidity/humidity.dart';
import 'package:smart_home/home_page/dashboard_box/weather_box/temperature/temperature.dart';
import 'package:smart_home/home_page/dashboard_box/weather_box/weather_box_presenter.dart';
import 'package:smart_home/home_page/dashboard_box/weather_box/weather_box_view.dart';
import 'package:flutter/material.dart';

import 'light/light.dart';

class WeatherBox extends StatefulWidget {
  const WeatherBox({super.key});

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> implements WeatherView {
  double temperature = -11.11;
  double _humidity = 0;
  late WeatherBoxPresenter  _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = weatherBoxPresenter;
    _presenter.attachView(this);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
        child: Row(
          children: [
            Temperature(),
            const SizedBox(width: 15),
            Humidity(),
            const SizedBox(width: 15),
            Light(),
          ],
        ),
    );
  }


  // @override
  // void updateHumidity(double val) {
  //   // TODO: implement updateHumidity
  //   setState(() {
  //     _humidity = val;
  //   });
  // }
  //
  @override
  void updateTemperature(double val) {
    // TODO: implement updateTemperature
    setState(() {
      temperature = val;
    });
  }


}
