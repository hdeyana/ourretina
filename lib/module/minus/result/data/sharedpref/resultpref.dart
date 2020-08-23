import 'dart:convert';

import 'package:app/module/minus/result/data/model/resultitemmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin ResultPref {
  Future<void> saveResult(ResultItemModel value) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    List<ResultItemModel> a = await loadResult();
    a.add(value);
    final v = json.encode(a);
    await _pref.setString("results", v);
  }

  Future<List<ResultItemModel>> loadResult() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final jsonRaw = _pref.getString('results');
    try {
      final jsonV = json.decode(jsonRaw);
      return List<ResultItemModel>.from(jsonV.map((e) => ResultItemModel.fromJson(e)));
    } catch (e) {
      return [];
    }
  }
}
