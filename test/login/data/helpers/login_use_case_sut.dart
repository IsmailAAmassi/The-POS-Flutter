import 'package:thepos/features/login/data/api_login/api_login_service.dart';

import '../../../helpers/mock_client_stub.dart';

class LoginUseCaseSUT {
  LoginUseCaseSUT(this.client, this.apiLoginService);

  final MockClientStub client;
  final ApiLoginService apiLoginService;
}
