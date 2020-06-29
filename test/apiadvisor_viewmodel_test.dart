import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarchitecture/app/app_module.dart';
import 'package:flutterarchitecture/app/interfaces/client_http_interface.dart';
import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository.dart';
import 'package:flutterarchitecture/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  initModule(AppModule(),changeBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);

  //group test
  group("Api AdvisorViewModel", () {
    test('ApiadvisorViewModel Error', () async {
      when(Modular.get<IClientHttp>().get(
              'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=00910cdfbd0854ae28fc7a9c19bb825e'))
          .thenThrow(Exception());
      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.model.value, null);
    });

    test('ApiadvisorViewModel Sucesso', () async {
      when(Modular.get<IClientHttp>().get(
              'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=00910cdfbd0854ae28fc7a9c19bb825e'))
          .thenAnswer((_) => Future.value([
                ApiAdvisor(country: "br", date: "2020/05/10", text: "Oiie")
                    .toJson()
              ]));

      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.model.value, isA<ApiAdvisor>());
    });
  });

  //Instancias sem o mockito
  test('ApiadvisorViewModel Error', () async {
    final viewModel =
        ApiadvisorViewModel(ApiadvisorRepository(ClientHttpMockError()));

    await viewModel.fill();
    expect(viewModel.model.value, null);
  });

  test('ApiadvisorViewModel Sucesso', () async {
    final viewModel =
        ApiadvisorViewModel(ApiadvisorRepository(ClientHttpMock()));

    await viewModel.fill();
    expect(viewModel.model.value, isA<ApiAdvisor>());
  });
}

class ClientHttpMock implements IClientHttp {
  @override
  void addToken(String token) {
    // TODO: implement addToken
  }

  @override
  Future get(String url) async {
    return [
      ApiAdvisor(country: "br", date: "2020/05/10", text: "Oiie").toJson()
    ];
  }
}

class ClientHttpMockError implements IClientHttp {
  @override
  void addToken(String token) {
    // TODO: implement addToken
  }

  @override
  Future get(String url) async {
    return [];
  }
}

class ClientHttpMockito extends Mock implements IClientHttp {}
