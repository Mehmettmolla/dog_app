import 'package:dio/dio.dart';
import 'package:dog_app/product/constant/app_constant.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = NetworkManager._init();
    return _instace!;
  }

  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
  }
}