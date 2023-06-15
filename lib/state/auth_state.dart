import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState extends ChangeNotifier {
  bool get isLogin => _token != null;       // 토큰의 존재 여부로 로그인 가능 여부 결정
  String get token => _token;
  String get username => _username;
  String get password => _password;
  bool get firstInit => _firstInit;
  bool get savePassword => _savePassword;
  bool get saveUsername => _saveUsername;

  String _token;
  String _username;
  String _password;
  bool _firstInit;
  bool _savePassword = false;
  bool _saveUsername = false;


  // 이게 뭔지 잘모르겠음..
  Future<void> checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final init = prefs.getBool('init');

    if (init == null) {
      _firstInit = false;
      notifyListeners();
    } else {
      _firstInit = true;
      notifyListeners();
    }
  }

}
