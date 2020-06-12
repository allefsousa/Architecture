import 'package:flutter/material.dart';
import 'package:flutterarchitecture/app/app_controller.dart';
class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(value: AppController.instance.IsDark, onChanged: (value){
      AppController.instance.changeThemeViewModel.changeTheme(value);
    });
  }
}
