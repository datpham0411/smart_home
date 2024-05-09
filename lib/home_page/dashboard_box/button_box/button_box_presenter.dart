import 'package:smart_home/mvp/mvp_presenter.dart';
import 'button_box_view.dart';

ButtonBoxPresenter buttonBoxPresenter = ButtonBoxPresenter();

class ButtonBoxPresenter extends MvpPresenter<ButtonBoxView> {
  bool light = false;

}