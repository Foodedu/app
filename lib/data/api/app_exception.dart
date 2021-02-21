import 'package:dio/dio.dart';

class AppException {
  static String handleError(dynamic error, {String customMessageError}) {
    var errorDescription = '';

    try {
      var dioError = error as DioError;

      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = 'Truy vấn đến máy chủ bị huỷ';
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = 'Quá thời gian kết nối đến máy chủ';
          break;
        case DioErrorType.DEFAULT:
          errorDescription = 'Kết nối đến máy chủ thất bại';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = 'Quá thời gian nhận dữ liệu từ máy chủ';
          break;
        case DioErrorType.RESPONSE:
          var statusCode = dioError.response.statusCode;
          if (statusCode == 400) {
            errorDescription = customMessageError ?? 'Lỗi dữ liệu';
          } else if (statusCode == 401) {
            errorDescription = 'Lỗi xác thực người dùng';
          } else if (statusCode == 403) {
            errorDescription = 'Không có quyền truy cập';
          } else if (statusCode == 404) {
            errorDescription = 'Không tìm thấy dữ liệu';
          } else if (statusCode == 500) {
            errorDescription = 'Lỗi máy chủ';
          } else {
            errorDescription = 'Có lỗi xảy ra';
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = 'Quá thời gian gửi dữ liệu tới máy chủ';
          break;
      }
    } catch (e) {
      errorDescription = 'Có lỗi xảy ra';
    }
    return errorDescription;
  }
}
