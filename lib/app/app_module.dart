import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterarchitecture/app/app_controller.dart';
import 'package:flutterarchitecture/app/app_widget.dart';
import 'package:flutterarchitecture/app/interfaces/client_http_interface.dart';
import 'package:flutterarchitecture/app/interfaces/local_storage_interface.dart';
import 'package:flutterarchitecture/app/pages/home/home_controller.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository_interface.dart';
import 'package:flutterarchitecture/app/services/client_http_service.dart';
import 'package:flutterarchitecture/app/services/shared_local_storage_service.dart';
import 'package:flutterarchitecture/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutterarchitecture/app/viewmodels/change_theme_viewmodel.dart';

class AppModule extends MainModule{
  @override
  // Criando inejção de dependencias
  List<Bind> get binds  {
   return [
    Bind((i) => HomeController(i.get())),
    Bind((i) => ApiadvisorViewModel(i.get())),
    Bind<IApiAdvisor>((i) => ApiadvisorRepository(i.get())),
    Bind<IClientHttp>((i) => ClientHttpService()),
    Bind((i) => AppController(i.get()),lazy: false),
    Bind((i) => ChangeThemeViewModel(storage: i.get())),
    Bind<ILocalStorage>((i) => SharedLocalStorageService()),
    ];
  }

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<Router> get routers => null;

}