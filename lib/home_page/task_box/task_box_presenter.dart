import 'dart:convert';
import 'dart:ui';

import 'package:smart_home/home_page/task_box/task_box_view.dart';
import 'package:smart_home/mvp/mvp_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main_screen.dart';
import '../../model/adafruit_server.dart';
import '../../my_share/user.dart';

TaskBoxPresenter taskBoxPresenter = TaskBoxPresenter();

class TaskBoxPresenter extends MvpPresenter<TaskBoxView> {
  Map<String, dynamic> userMap = {};
  List<Map<String, dynamic>> DataSet = [];
  bool isConnected = true;
  int id = 1;

  TextEditingController userController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mixer1Controller = TextEditingController();
  TextEditingController _mixer2Controller = TextEditingController();
  TextEditingController _mixer3Controller = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _cycleController = TextEditingController();
  TextEditingController _starttimeController = TextEditingController();

  TimeOfDay starttime = TimeOfDay.now();

  void updateAreaController(String? area) {
    _areaController.text = area.toString();
  }

  void updateStartTimeController (String s) {
    _starttimeController.text = s;
  }

  void AddADataSet (Map<String, dynamic> newDataSet) {
    DataSet.add(newDataSet);
    id += 1;
  }
  void ClearAllDataSet () {
    DataSet.clear();
    id = 1;
  }

  void PrintDataSet (String s) {
    // DataSet.map((map) => print(map)).toList();
    print(s);
  }

  Future newtaskOnPressed(BuildContext context) async {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Material(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                  child: Container(
                    color: Colors.transparent.withOpacity(0.15),
                  ),
                ),
              ),
            ),
          AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.8999999761581421),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New task",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent.withOpacity(0.7),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                  onPressed: () {CreateNewTask(context);},
                  child: const Text("Create", style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ),
            ],
          ),
          content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: 470,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Name of New Task",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _nameController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Area', style: TextStyle(fontSize: 20),),
                            Text(
                              _areaController.text
                                  .toString()
                                  .isEmpty ? "None" : _areaController
                                  .text.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down_circle_outlined, size: 40),
                              onSelected: (String? area) {
                                setState(() {
                                  _areaController.text = area.toString();
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: '1',
                                  child: Text('Area 1',
                                      style: TextStyle(fontSize: 20)),),
                                PopupMenuItem<String>(
                                  value: '2',
                                  child: Text(
                                      'Area 2', style: TextStyle(fontSize: 20)),
                                ),
                                PopupMenuItem<String>(
                                  value: '3',
                                  child: Text(
                                      'Area 3', style: TextStyle(fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "1st Mixer",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _mixer1Controller,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'^\.')),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "2nd Mixer",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _mixer2Controller,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'^\.')),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "3rd Mixer",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _mixer3Controller,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'^\.')),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Cycle",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _cycleController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Start Time \n'
                                    '${starttime.hour}:${starttime.minute}',
                                style: TextStyle(fontSize: 20)),
                            SizedBox(width: 10),
                            Container(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final TimeOfDay? pickedTime = await showCustomTimePicker(
                                    context: context,
                                    initialTime: starttime, // Thời gian ban đầu
                                  );
                                  if (pickedTime != null) {
                                    setState(() {
                                      starttime = pickedTime;
                                      if (starttime.hour < 10 || starttime.minute < 10) {
                                        if (starttime.hour < 10 && starttime.minute >= 10) {
                                          updateStartTimeController(
                                              '0${starttime.hour
                                                  .toString()}:${starttime
                                                  .minute
                                                  .toString()}');
                                        }
                                        else if (starttime.minute < 10 && starttime.hour >= 10) {
                                          updateStartTimeController(
                                              '${starttime.hour
                                                  .toString()}:0${starttime
                                                  .minute
                                                  .toString()}');
                                        }
                                        else {
                                          updateStartTimeController(
                                              '0${starttime.hour.toString()}:0${starttime.minute.toString()}'
                                          );
                                        }
                                      }
                                      else {
                                        updateStartTimeController(
                                            '${starttime.hour
                                                .toString()}:${starttime.minute
                                                .toString()}');
                                      }
                                    });
                                  }
                                },
                                child: Text("Choose",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
              ],
            );
          },
    );
  }

  Future<TimeOfDay?> showCustomTimePicker({
    required BuildContext context,
    required TimeOfDay initialTime,
  })
  async {
    TimeOfDay? selectedTime = initialTime;

    await showModalBottomSheet<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 300,
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select Time", style: TextStyle(fontSize: 25, color: Colors.black),),
                          TextButton(
                            onPressed: () {Navigator.pop(context);},
                            child: Text("Done", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration: Duration(
                          hours: initialTime.hour,
                          minutes: initialTime.minute,
                        ),
                        onTimerDurationChanged: (Duration changedTime) {
                          setState(() {
                            selectedTime = TimeOfDay(
                              hour: changedTime.inHours,
                              minute: changedTime.inMinutes.remainder(60),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
    return selectedTime;
  }

  Future CreateNewTask(BuildContext context) async {
    if (_nameController.text.isEmpty || _areaController.text.isEmpty ||
        _mixer1Controller.text.isEmpty || _mixer2Controller.text.isEmpty ||
        _mixer3Controller.text.isEmpty ||
        _cycleController.text.isEmpty || _starttimeController.text.isEmpty)
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.error_outlined, size: 30, color: Colors.red,),
                SizedBox(width: 20),
                Text("ERROR", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),),
              ],
            ),
            content: Text(
              "Please fill in all fields!", style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),),
              ),
            ],
          );
        },
      );
    }
    else {

      User user = User('create', '${_nameController.text}', '${id.toString()}', '${_areaController.text}', double.parse(_mixer1Controller.text), double.parse(_mixer2Controller.text), double.parse(_mixer3Controller.text), int.parse(_cycleController.text), '${_starttimeController.text}');
      userMap = user.toJson();
      String jsonString = JsonEncoder.withIndent(' ').convert(userMap);
      adafruitServer.mqttHelp.publish('datpham0411/feeds/iot-mobile', jsonString);

      AddADataSet(userMap);

      PrintDataSet(jsonString);

      if (DataSet.length >=10) {
        ClearAllDataSet();
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      ).then((_) => Navigator.pop(context));

      _nameController.text = "";
      _areaController.text = "";
      _mixer1Controller.text = "";
      _mixer2Controller.text = "";
      _mixer3Controller.text = "";
      _cycleController.text = "";
      _starttimeController.text = "";
      starttime = TimeOfDay(hour: 0, minute: 0);
    }
  }


}