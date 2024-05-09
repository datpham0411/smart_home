
import 'package:smart_home/mvp/mvp_view.dart';

abstract class WeatherView extends MvpView{
  void updateTemperature(double val);
  // void updateHumidity(double val);
}