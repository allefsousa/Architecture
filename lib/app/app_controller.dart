import 'package:flutter/widgets.dart';

class AppController{

  //singleton
  static final AppController instance = AppController._();
  AppController._();

  final  themeSwitch = ValueNotifier<bool>(false);
  changeTheme(bool value){
    themeSwitch.value = value;
  }
}