import 'package:flutter/widgets.dart';
import 'package:flutterarchitecture/app/interfaces/local_storage_interface.dart';
import 'package:flutterarchitecture/app/models/appconfig_model.dart';
import 'package:flutterarchitecture/app/services/shared_local_storage_service.dart';

class AppController{

  //singleton
  static final AppController instance = AppController._();
  AppController._(){
    storage.get('isDark').then((value){
      if (value != null){
        config.themeSwitch.value = value;
      }
    });
  }

  final AppConfigModel config = AppConfigModel();
  bool get IsDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();



  changeTheme(bool value){
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}