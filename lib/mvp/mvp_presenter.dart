import 'mvp_view.dart';

abstract class MvpPresenter<T extends MvpView>{
  late T view;

  void attachView(T view){
    this.view = view;
  }
  void deAttachView(){
    this.view = Null as T;
  }
  bool get isViewAttached{
    return view != Null;
  }
  void checkViewAttached(){
    if(view == Null){
      throw Exception("attached view is null!");
    }
  }
  getView(){
    return view;
  }
}