import 'dart:ffi';

import 'package:smart_home/main_screen.dart';

import 'temperature_view.dart';
import 'package:flutter/material.dart';

import 'temperature_presenter.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> implements TemperatureView {
  late TemperaturePresenter _presenter;
  double _temp = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = temperaturePresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _temp = -11.11;
    });
  }

  @override
  void updateData(double value) {
    // TODO: implement updateData
    setState(() {
      // Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => MainScreen()),
      //       ).then((_) => Navigator.pop(context));
      // print('current: $_temp and new: $value');
        _temp = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        // width: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.transparent.withOpacity(0.45),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.device_thermostat_outlined, size: 40, color: Colors.white,),
            Text("${_temp}℃", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

}
