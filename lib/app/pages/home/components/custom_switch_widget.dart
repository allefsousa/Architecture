import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarchitecture/app/app_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Modular.get<AppController>().IsDark,
        onChanged: (value) {
          Modular.get<AppController>().changeThemeViewModel.changeTheme(value);
        });
  }
}
