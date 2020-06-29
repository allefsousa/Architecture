import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarchitecture/app/app_controller.dart';
import 'package:flutterarchitecture/app/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: Modular.get<AppController>().themeSwitch,
        builder: (context, isDark, child) {
          return MaterialApp(
            title: 'Flutter Architeture',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: isDark ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
          );
        });
  }
}
