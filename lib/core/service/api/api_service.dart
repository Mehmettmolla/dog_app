
import 'package:dio/dio.dart';
import 'package:dog_app/core/enum/http_status/http_status_enum.dart';
import 'package:dog_app/core/enum/request_type/request_type_enum.dart';
import 'package:dog_app/core/init/network/network_manager.dart';
import 'package:dog_app/core/service/base/base_service.dart';
import 'package:dog_app/product/constant/app_constant.dart';
import 'package:dog_app/product/models/base/base_model.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiService extends BaseService {
  
  Future<dynamic> getRequest({
    required String endPoint,
    FromJson? fromJson,
  }) async {
    return await request(
      endPoint: endPoint,
      type: RequestType.GET,
      fromJson: fromJson,
    );
  }

  Future<dynamic> postRequest({
    required String endPoint,
    dynamic data,
    FromJson? fromJson,
  }) async {
    return await request(
      endPoint: endPoint,
      type: RequestType.POST,
      data: data,
      fromJson: fromJson,
    );
  }

  @override
  Future<dynamic> request({
    final String? endPoint,
    final RequestType? type,
    dynamic data,
    FromJson? fromJson,
  }) async {
    try {
      late final Response response;
      switch (type!) {
        case RequestType.GET:
          response = await NetworkManager.instance.dio
              .get("${AppConstant.baseUrl}$endPoint");
          break;
        case RequestType.POST:
          response = await NetworkManager.instance.dio
              .post("${AppConstant.baseUrl}$endPoint", data: data);
          break;
      }
      return _handleResponse(response, fromJson);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _handleResponse(Response response, FromJson? fromJson) {
    HttpStatus status = _statusCodeToHttpStatus(response.statusCode);
    switch (status) {
      case HttpStatus.OK:
      case HttpStatus.CREATED:
      case HttpStatus.NO_CONTENT:
        if (fromJson != null) {
          return fromJson(response.data as Map<String, dynamic>);
        } else {
          return BaseModel.fromJson(response.data as Map<String, dynamic>);
        }
      case HttpStatus.BAD_REQUEST:
      default:
        throw 'Hata kodu: ${response.statusCode}\nHata mesajı: ${response.statusMessage}';
    }
  }

  HttpStatus _statusCodeToHttpStatus(int? statusCode) {
    switch (statusCode) {
      case 200:
        return HttpStatus.OK;
      case 201:
        return HttpStatus.CREATED;
      case 204:
        return HttpStatus.NO_CONTENT;
      case 400:
        return HttpStatus.BAD_REQUEST;
      default:
        throw 'Bilinmeyen durum kodu: $statusCode';
    }
  }
}