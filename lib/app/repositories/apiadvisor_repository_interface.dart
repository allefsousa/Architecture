import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisor> getTemp();
}
