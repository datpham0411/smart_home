import 'package:smart_home/home_page/dashboard_box/button_box/pump/pump_presenter.dart';
import 'package:smart_home/home_page/dashboard_box/button_box/pump/pump_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../main_screen.dart';

class Pump extends StatefulWidget {
  const Pump({super.key});

  @override
  State<Pump> createState() => _PumpState();
}

class _PumpState extends State<Pump> implements PumpView {
  late PumpPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = pumpPresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
  }

  @override
  void updateData(int value) {
    // TODO: implement updateData
    setState(() {
      if (value == 1) _presenter.pump = true;
      else _presenter.pump = false;
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MainScreen()),
      // ).then((_) => Navigator.pop(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: _presenter.pump ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              _presenter.pump = !_presenter.pump;
              _presenter.PumpOnPressed(context);
            });
          },
          icon: _presenter.pump ? const Icon(Icons.heat_pump_outlined, color: Colors.white, size: 40) : Icon(Icons.heat_pump_outlined, color: Colors.transparent.withOpacity(0.45), size: 40),
        ),
      ),
    );
  }
}

