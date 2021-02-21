import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/constants/const_common.dart';
import '../../models/user.dart';
import '../../models/user_request.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ConstCommon.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/api/login')
  Future<User> login(@Body() UserRequest userRequest);
}
