import 'package:flutterarchitecture/app/interfaces/client_http_interface.dart';
import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor{

  final IClientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiAdvisor> getTemp() async {
    
    var json =  await  client.get("http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=00910cdfbd0854ae28fc7a9c19bb825e");

    ApiAdvisor model = ApiAdvisor.fromJson(json[0]);
    return model;

  }

}