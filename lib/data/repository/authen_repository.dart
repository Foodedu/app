import 'dart:async';

import '../../common/constants/const_common.dart';
import '../../models/user.dart';
import '../../models/user_request.dart';
import '../../utils/pref.dart';
import '../api/dio_provider.dart';
import '../api/rest_client.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final dio = DioProvider.instance();
  final pref = LocalPref();

  Stream<AuthenticationStatus> get status async* {
    try {
      var isLogged = await pref.getBool(PrefKey.isLogged) ?? false;
      var expiredTime = await pref.getString(PrefKey.expired_time);
      var currentTime = DateTime.now().millisecondsSinceEpoch;
      var isNotExpired =
          (currentTime - int.tryParse(expiredTime)) < ConstCommon.kExpiredTime;

      if (isLogged && isNotExpired) {
        yield AuthenticationStatus.authenticated;
      } else {
        yield AuthenticationStatus.unauthenticated;
      }
    } catch (_) {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<User> signInWithCredentials(String phone, String password) {
    final client = RestClient(dio);
    var result = client.login(UserRequest(phone: phone, password: password));
    return result;
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
