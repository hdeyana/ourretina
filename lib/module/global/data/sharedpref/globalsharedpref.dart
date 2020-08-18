import 'package:app/app/controller/basecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin GlobalSharedPref on BaseController {
  Future<void> setTrained() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setBool('trained', true);
  }

  Future<bool> loadTrained() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getBool('trained') ?? false;
  }

  Future<void> setCameraPolicyRead() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setBool('cameraPol', true);
  }

  Future<bool> loadCameraPolicyRead() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getBool('cameraPol') ?? false;
  }
}
