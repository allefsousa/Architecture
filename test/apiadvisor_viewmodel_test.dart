import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarchitecture/app/interfaces/client_http_interface.dart';
import 'package:flutterarchitecture/app/models/apiadvisor_model.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository.dart';
import 'package:flutterarchitecture/app/viewmodels/apiadvisor_viewmodel.dart';

main(){

  //group test
  group("Api AdvisorViewModel", (){

    test('ApiadvisorViewModel Error', () async{
      final viewModel = ApiadvisorViewModel(
          ApiadvisorRepository(ClientHttpMockError())
      );

      await viewModel.fill();
      expect(viewModel.model.value, null);


    });


    test('ApiadvisorViewModel Sucesso', () async{
      final viewModel = ApiadvisorViewModel(
          ApiadvisorRepository(ClientHttpMock())
      );

      await viewModel.fill();
      expect(viewModel.model.value, isA<ApiAdvisor>());


    });

  });

  test('ApiadvisorViewModel Error', () async{
    final viewModel = ApiadvisorViewModel(
      ApiadvisorRepository(ClientHttpMockError())
    );

    await viewModel.fill();
    expect(viewModel.model.value, null);


  });


  test('ApiadvisorViewModel Sucesso', () async{
    final viewModel = ApiadvisorViewModel(
      ApiadvisorRepository(ClientHttpMock())
    );

    await viewModel.fill();
    expect(viewModel.model.value, isA<ApiAdvisor>());


  });
}


class ClientHttpMock implements IClientHttp{
  @override
  void addToken(String token) {
    // TODO: implement addToken
  }

  @override
  Future get(String url) async {
    return [
      ApiAdvisor(country: "br",date: "2020/05/10",text: "Oiie").toJson()
    ];
  }

}

class ClientHttpMockError implements IClientHttp{
  @override
  void addToken(String token) {
    // TODO: implement addToken
  }

  @override
  Future get(String url) async {
    return [];
  }

}