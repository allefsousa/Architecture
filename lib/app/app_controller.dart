import 'package:flutter/widgets.dart';
import 'package:flutterarchitecture/app/models/appconfig_model.dart';

class AppController{

  //singleton
  static final AppController instance = AppController._();
  AppController._();

  final AppConfigModel config = AppConfigModel();
  bool get IsDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value){
    config.themeSwitch.value = value;
  }
}