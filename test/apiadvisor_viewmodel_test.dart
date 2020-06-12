import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarchitecture/app/repositories/apiadvisor_repository.dart';
import 'package:flutterarchitecture/app/services/client_http_service.dart';
import 'package:flutterarchitecture/app/viewmodels/apiadvisor_viewmodel.dart';

main(){
  test('ApiadvisorViewModel error', (){
    final viewModel = ApiadvisorViewModel(
      ApiadvisorRepository(ClientHttpService())
    );




  });
}