
import 'package:smart_home/mvp/mvp_view.dart';

abstract class DataView extends MvpView{
  void updateData(double value);
  void onFailUpdate();
}
abstract class BoolView extends MvpView{
  void updateBool(bool value);
  void onFailUpdate();
}

abstract class LightView  extends DataView{

}