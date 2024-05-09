import 'package:smart_home/home_page/dashboard_box/dashboard_box.dart';
import 'package:smart_home/home_page/task_box/task_box.dart';
import 'package:smart_home/home_page/tool_bar/tool_bar.dart';
import 'package:smart_home/home_page/welcome_box/welcome_box.dart';
import 'package:smart_home/my_share/background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Background(),
        Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 7,
              child: WelcomeBox()
            ),
            Expanded(
                flex: 23,
                child: DashboardBox()
            ),
            Expanded(
                flex: 29,
                child: TaskBox()
            ),
            Expanded(
                flex: 9,
                child: ToolBar()
            ),
            // SizedBox(
            //   height: 5,
            // ),
          ],
        ),
      ],
    );
  }
}
