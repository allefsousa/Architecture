import 'package:flutter/material.dart';
import 'package:flutterarchitecture/app/app_controller.dart';
import 'package:flutterarchitecture/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    
    return ValueListenableBuilder<bool>
      (valueListenable: AppController.instance.themeSwitch,
        builder: (context,isDark,child){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness:  isDark ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
          );
        });
  }

}