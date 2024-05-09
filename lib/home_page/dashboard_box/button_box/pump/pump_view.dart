import 'package:smart_home/mvp/mvp_view.dart';

abstract class PumpView extends MvpView{
  void updateData(int value);
  void onFailUpdate();
}
