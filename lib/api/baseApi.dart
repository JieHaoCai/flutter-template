import 'package:dio/dio.dart';

class BaseApi {
  static const String baseUrl = 'http://m-lt.bliiblii.com';

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        //这种方式以 application/x-www-form-urlencoded 格式编码，默认是json格式的
        contentType: Headers.formUrlEncodedContentType),
  );

  //get请求
  Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic>? params, String? conf) async {
    final response = await _dio.get(
      path,
      queryParameters: params,
      options: conf == 'stream'
          ? Options(responseType: ResponseType.stream) // 设置接收类型为 `stream`
          : conf == 'bytes'
              ? Options(responseType: ResponseType.bytes) // 设置接收类型为 `bytes`
              : Options(),
    );
    return _handleResponse(response);
  }

  //post请求
  Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic>? data,
  ) async {
    final response = await _dio.post(
      path,
      data: data,
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> _handleResponse(Response response) async {
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 400) {
      return {};
      // throw BadRequestException(response.data.toString());
    } else if (response.statusCode == 401) {
      return {};
      // throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      return {};
      // throw ForbiddenException();
    } else if (response.statusCode == 500) {
      return {};
      // throw ServerException();
    } else {
      return {};
      // throw UnknownException();
    }
  }
}
