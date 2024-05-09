
import 'package:smart_home/mvp/mvp_view.dart';

abstract class DashboardBoxView extends MvpView{
  void setCity(String city);
  void updateTime(String time);
}