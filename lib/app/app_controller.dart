import 'package:flutter/widgets.dart';
import 'package:flutterarchitecture/app/services/shared_local_storage_service.dart';
import 'package:flutterarchitecture/app/viewmodels/change_theme_viewmodel.dart';

class AppController {
  //singleton

  final ChangeThemeViewModel changeThemeViewModel ;

  AppController(this.changeThemeViewModel){
    changeThemeViewModel.init();
  }

  bool get IsDark => changeThemeViewModel.config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
