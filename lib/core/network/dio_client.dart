import 'package:demo/core/entities/base_response.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  final String url;
  final Map<String, dynamic> data;

  DioClient({required this.url, required this.data});

  Future<BaseResponse?> json() async {
    try {
      Response response = await _dio.request(
        url,
        data: data,
        options: Options(contentType: Headers.jsonContentType, method: "POST"),
      );
      return BaseResponse.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response?.data != null) {
        return BaseResponse.fromJson(e.response!.data);
      }
      return null;
    }
  }
}

