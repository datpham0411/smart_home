import 'package:smart_home/home_page/dashboard_box/button_box/button_box_presenter.dart';
import 'package:smart_home/home_page/dashboard_box/button_box/button_box_view.dart';
import 'package:smart_home/home_page/dashboard_box/button_box/led/led.dart';
import 'package:smart_home/home_page/dashboard_box/button_box/pump/pump.dart';
import 'package:smart_home/main_screen.dart';
import 'package:flutter/material.dart';

class ButtonBox extends StatefulWidget {
  const ButtonBox({super.key});

  @override
  State<ButtonBox> createState() => _ButtonBoxState();
}

class _ButtonBoxState extends State<ButtonBox> implements ButtonBoxView {
  late ButtonBoxPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = buttonBoxPresenter;
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent.withOpacity(0.45),
            ),
            child: const Row(
              children: [
                Led(),
                Pump(),
              ],
            ),
          ),
          SizedBox(width: 15),
          Container(
            width: 90,
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent.withOpacity(0.45),
            ),
            child: Expanded(
              flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainScreen()),
                            ).then((_) => Navigator.pop(context));
                          });
                        },
                        icon: Icon(Icons.refresh_outlined, color: Colors.transparent.withOpacity(0.45), size: 40),
                      ),
                    ),
                  ],
                ),
            ),

          ),
        ],
      ),

    );
  }
}
