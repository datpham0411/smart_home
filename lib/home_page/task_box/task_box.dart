import 'package:smart_home/home_page/task_box/data_set_box/data_set_box.dart';
import 'package:smart_home/home_page/task_box/task_box_presenter.dart';
import 'package:smart_home/home_page/task_box/task_box_view.dart';
import 'package:flutter/material.dart';

class TaskBox extends StatefulWidget {
  const TaskBox({super.key});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> implements TaskBoxView{
  late TaskBoxPresenter _taskboxpresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskboxpresenter = taskBoxPresenter;
    _taskboxpresenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Column(
              children: [
                Row (
                  children: [
                    Expanded(
                      flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text("Scheduled Task", style: TextStyle(fontSize: 36, color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold)),
                        ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: IconButton(
                          onPressed: () {_taskboxpresenter.newtaskOnPressed(context);},
                          icon: Icon(Icons.history, size: 43, color: Colors.white.withOpacity(0.75)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: GestureDetector(
                            child: IconButton(
                                onPressed: !_taskboxpresenter.isConnected ? null : () {_taskboxpresenter.newtaskOnPressed(context);},
                                icon: Icon(Icons.add_circle_outline, size: 43, color: Colors.white.withOpacity(0.75),)),
                          ),
                        ),

                    ),
                  ],
                ),
                const DataSetBox(),
              ],
            ),
        ],
      ),
    );
  }
}
