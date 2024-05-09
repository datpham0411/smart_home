import 'dart:ui';

import 'package:smart_home/home_page/task_box/data_set_box/data_set_box_view.dart';
import 'package:smart_home/home_page/task_box/task_box_presenter.dart';
import 'package:smart_home/mvp/mvp_presenter.dart';
import 'package:smart_home/my_share/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DataSetBoxPresenter dataSetBoxPresenter = DataSetBoxPresenter();

class DataSetBoxPresenter extends MvpPresenter<DataSetBoxView> {

  Future detailtaskOnPressed(BuildContext context, int index, TaskBoxPresenter _taskboxpresenter) async {
    bool isDialogOpen = false;
    showCupertinoDialog (
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                  Navigator.of(context).pop();
              },
              child: Material (
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                  child: Container(
                    color: Colors.white.withOpacity(0.15),
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent.withOpacity(0.45),
                      title: Text("Detail task ${_taskboxpresenter.DataSet[index]['name']}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
                      content: Container(
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            '\t \t Name: ${_taskboxpresenter.DataSet[index]['name']} \n'
                                '\t \t Area: ${_taskboxpresenter.DataSet[index]['area']} \n'
                                '\t \t 1st Mixer: ${_taskboxpresenter.DataSet[index]['mixer1']} \n'
                                '\t \t 2nd Mixer: ${_taskboxpresenter.DataSet[index]['mixer2']} \n'
                                '\t \t 3rd Mixer: ${_taskboxpresenter.DataSet[index]['mixer3']} \n'
                                '\t \t Cycle: ${_taskboxpresenter.DataSet[index]['cycle']} \n'
                                '\t \t Start Time: ${_taskboxpresenter.DataSet[index]['starttime']}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
