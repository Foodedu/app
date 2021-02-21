part of 'rest_client.dart';

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.vn';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<User> login(userRequest) async {
    ArgumentError.checkNotNull(userRequest, 'userRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/api/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }
}
