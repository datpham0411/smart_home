import '../../../../main_screen.dart';
import 'light_view.dart';
import 'package:flutter/material.dart';

import 'light_presenter.dart';

class Light extends StatefulWidget {
  const Light({super.key});

  @override
  State<Light> createState() => _LightState();
}

class _LightState extends State<Light> implements LightView {
  double _light = 0;
  late LightPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = lightPresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void updateData(double value) {
    // TODO: implement updateData
    setState(() {
      _light = value;
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
      _light = -11.11;
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
            const Icon(Icons.light_mode_outlined, size: 40, color: Colors.white,),
            Text("$_light%", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
