import 'package:dio/dio.dart';
import 'package:flutter_design_patten/exception/AppException.dart';

/// Created by JAI
class DioClient {
  // dio instance
  final Dio _dio = Dio();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String uri, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    var response;

    try {
      response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      response = _returnResponse(response);
    }catch(e) {
      throw FetchDataException('No Internet connection');
//      throw FetchDataException(e.toString());
    }

    return response;
  }


  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
//        throw BadRequestException(response.data.toString());
        var responseJson = response.data;
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }
}