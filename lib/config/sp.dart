import 'package:get_storage/get_storage.dart';

class MyPref{
  static   GetStorage? _myPref;
  static GetStorage? getInstance() {
    if(_myPref!=null){
      return _myPref;
    }else{
      return GetStorage();
    }
  }
}