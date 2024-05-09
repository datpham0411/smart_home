

import 'package:flutter/material.dart';

import '../../../../main_screen.dart';
import 'humidity_presenter.dart';
import 'humidity_view.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> implements HumidityView {
  double _humid = 0;
  late HumidityPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = humidityPresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void updateData(double value) {
    // TODO: implement updateData
    setState(() {
      _humid = value;
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MainScreen()),
      // ).then((_) => Navigator.pop(context));
    });
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _humid = -11.11;
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
            const Icon(Icons.water_drop_outlined, size: 40, color: Colors.white,),
            Text("$_humid%", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}