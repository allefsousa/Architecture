import 'package:flutter/widgets.dart';
import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';
import 'package:flutterarchitecture/app/viewmodels/apiadvisor_viewmodel.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisor> get temp => viewModel.model;

  getTemp() {
    viewModel.fill();
  }
}
