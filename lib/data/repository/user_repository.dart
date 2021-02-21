import 'package:dio_http_cache/dio_http_cache.dart';

import '../../common/constants/const_common.dart';
import '../../models/user.dart';
import '../../models/user_request.dart';
import '../api/dio_provider.dart';
import '../api/rest_client.dart';

class UserRepository {
  final dio = DioProvider.instance();
  var op = buildConfigurableCacheOptions(
      forceRefresh: true, maxAge: Duration(days: ConstCommon.kMaxAgeCache));

  Future<User> signInWithCredentials(String phone, String password) {
    final client = RestClient(dio);
    return client.login(UserRequest(phone: phone, password: password));
  }
}
