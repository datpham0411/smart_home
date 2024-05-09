import 'package:smart_home/home_page/task_box/task_box_presenter.dart';
import 'package:smart_home/home_page/task_box/task_box_view.dart';
import 'package:smart_home/home_page/tool_bar/tool_bar_presenter.dart';
import 'package:smart_home/home_page/tool_bar/tool_bar_view.dart';
import 'package:smart_home/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> implements ToolBarView, TaskBoxView {
  late ToolBarPresenter _toolbarpresenter;
  late TaskBoxPresenter _taskboxpresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _toolbarpresenter = toolBarPresenter;
    _toolbarpresenter.attachView(this);
    _taskboxpresenter = taskBoxPresenter;
    _taskboxpresenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.15),
          borderRadius: BorderRadius.circular(40)
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.symmetric(vertical:5, horizontal: 25),
                child: IconButton(
                  onPressed: _taskboxpresenter.isConnected
                      ? null : (){_toolbarpresenter.serverOnPressed(context);},
                  icon: Icon(_taskboxpresenter.isConnected ? Icons.sensors : Icons.sensors_off,
                      size: 40, color: Colors.white),
                ),
              ),
          ),
        ],
      ),
    );
  }



  @override
  void setStatus(bool status) {
    // TODO: implement updateStatus
    setState(() {
      _taskboxpresenter.isConnected = status;
    });
  }
}
