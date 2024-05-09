import 'package:smart_home/home_page/dashboard_box/button_box/led/led_presenter.dart';
import 'package:smart_home/home_page/dashboard_box/button_box/led/led_view.dart';
import 'package:flutter/material.dart';

import '../../../../main_screen.dart';

class Led extends StatefulWidget {
  const Led({super.key});

  @override
  State<Led> createState() => _LedState();
}

class _LedState extends State<Led> implements LedView{
  late LedPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = ledPresenter;
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
      if (value == 1) _presenter.led = true;
      else _presenter.led = false;
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
          color: _presenter.led ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              _presenter.led = !_presenter.led;
              _presenter.LedOnPressed(context);
            });
          },
          icon: _presenter.led ? const Icon(Icons.lightbulb_outline_rounded, color: Colors.white, size: 40) : Icon(Icons.lightbulb_outline_rounded, color: Colors.transparent.withOpacity(0.45), size: 40),
        ),
      ),
    );
  }
}
