import 'package:flutter/widgets.dart';
import 'package:flutterarchitecture/app/interfaces/local_storage_interface.dart';
import 'package:flutterarchitecture/app/models/appconfig_model.dart';
import 'package:flutterarchitecture/app/services/shared_local_storage_service.dart';
import 'package:flutterarchitecture/app/viewmodels/change_theme_viewmodel.dart';

class AppController{

  //singleton
  static final AppController instance = AppController._();
  AppController._(){
    changeThemeViewModel.init();
  }

  final ChangeThemeViewModel changeThemeViewModel = ChangeThemeViewModel(storage: SharedLocalStorageService());

  bool get IsDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => changeThemeViewModel.config.themeSwitch;



}