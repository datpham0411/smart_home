import 'package:smart_home/home_page/dashboard_box/weather_box/weather_box.dart';
import 'package:flutter/material.dart';

import 'button_box/button_box.dart';
import 'dashboard_box_presenter.dart';
import 'dashboard_box_view.dart';

class DashboardBox extends StatefulWidget {
  const DashboardBox({super.key});

  @override
  State<DashboardBox> createState() => _DashboardBoxState();
}

class _DashboardBoxState extends State<DashboardBox> implements DashboardBoxView {
   String _city = "";
   String _time = "";
  late DashboardBoxPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = DashboardBoxPresenter();
    _presenter.attachView(this);
    _presenter.getCity();
    _presenter.getTime();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1),
      ),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding:const EdgeInsets.all(10),
      child: Column(
        children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 290,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0), borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              _city,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                            ),
                            const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Text(
                          _time,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherBox(),
                        SizedBox(height: 15),
                        ButtonBox(),
                ],
              ),
            ),
          ],
              ),
    ),
    ],
      ),
    );
  }

  @override
  void setCity(String city) {
    // TODO: implement setCity
    setState(() {
      _city = city;
    });
  }

  @override
  void updateTime(String time) {
    // TODO: implement updateTime
    setState(() {
      _time = time;
    });
  }

}
