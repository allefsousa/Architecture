import 'package:flutter/cupertino.dart';
import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorViewModel {
  final model = ValueNotifier<ApiAdvisor>(null);
  final IApiAdvisor repository;

  ApiadvisorViewModel(this.repository);

  fill() async {
    try{
      model.value = await repository.getTemp();
    }catch (e){
      print(e);
    }
  }
}
