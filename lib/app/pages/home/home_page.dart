import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';
import 'package:flutterarchitecture/app/pages/home/home_controller.dart';


import 'components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.account_circle),
          onPressed: () {
            controller.getTemp();
          }),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiAdvisor>(
              valueListenable: controller.temp,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Text(model.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
