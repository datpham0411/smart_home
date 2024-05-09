
import 'package:smart_home/mvp/mvp_presenter.dart';

import 'dashboard_box_view.dart';


class DashboardBoxPresenter extends MvpPresenter<DashboardBoxView>{
  void getCity(){
    checkViewAttached();
    String name = "Ho Chi Minh City";
    isViewAttached ? getView().setCity(name) : null;
  }
  void getTime(){
    checkViewAttached();
    DateTime time = DateTime.now();
    final day = time.day;
    final month = time.month;
    final year = time.year;
    isViewAttached ? getView().updateTime("$day/$month/$year") : null;
  }
}