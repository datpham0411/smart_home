import 'dart:convert';

import 'package:smart_home/home_page/task_box/data_set_box/data_set_box_presenter.dart';
import 'package:smart_home/home_page/task_box/data_set_box/data_set_box_view.dart';
import 'package:smart_home/home_page/task_box/task_box_presenter.dart';
import 'package:smart_home/my_share/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/my_share/user.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../model/adafruit_server.dart';
import '../../tool_bar/tool_bar_presenter.dart';
import '../../tool_bar/tool_bar_view.dart';
import '../task_box_view.dart';

class DataSetBox extends StatefulWidget {
  const DataSetBox({super.key});

  @override
  State<DataSetBox> createState() => _DataSetBoxState();
}

class _DataSetBoxState extends State<DataSetBox> implements DataSetBoxView, TaskBoxView, ToolBarView {
  late DataSetBoxPresenter _datasetboxpresenter;
  late TaskBoxPresenter _taskboxpresenter;

  @override
  void initState() {
    super.initState();
    _datasetboxpresenter = dataSetBoxPresenter;
    _datasetboxpresenter.attachView(this);
    _taskboxpresenter = taskBoxPresenter;
    _taskboxpresenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 265,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _taskboxpresenter.DataSet.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            _datasetboxpresenter.detailtaskOnPressed(context, index, _taskboxpresenter);
                                          },
                                          child: Text(
                                            '\t Name: ${_taskboxpresenter.DataSet[index]['name']} \n'
                                                '\t Start Time: ${_taskboxpresenter.DataSet[index]['starttime']}',
                                            style: TextStyle(fontSize: 18, color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 100),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              User user = User('delete', '', '${_taskboxpresenter.DataSet[index]['id']}', '', -11.11, -11.11, -11.11, -11, '');
                                              _taskboxpresenter.userMap = user.toJson();
                                              adafruitServer.mqttHelp.publish('datpham0411/feeds/iot-mobile', _taskboxpresenter.userMap.toString());

                                              _taskboxpresenter.DataSet.removeAt(index);
                                              if (_taskboxpresenter.DataSet.length == 0) {
                                                _taskboxpresenter.id = 1;
                                              }
                                            });
                                          },
                                          icon: Icon(Icons.cancel_outlined),
                                          color: Colors.red,
                                          iconSize: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void setStatus(bool status) {
  }
}
