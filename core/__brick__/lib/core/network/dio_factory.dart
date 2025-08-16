import 'package:dio/dio.dart';

import '../data_sources/local/shared_preferences_helper.dart';
import '../utils/app_enums.dart';
import '../utils/app_functions.dart';
import '../utils/constants.dart';
import 'endpoints.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      _addDioInterceptor();
      _addDioOptions();
      return dio!;
    } else {
      dPrint(
        "Final headers: ${dio!.options.headers}",
        stringColor: StringColor.yellow,
      );

      return dio!;
    }
  }

  static void addDioHeaders() async {
    dPrint(
      "Token: ${await SharedPreferencesHelper.getSecuredString(LocalStorageKeys.apiToken)}",
      stringColor: StringColor.green,
    );

    dio?.options.headers = {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${await SharedPreferencesHelper.getSecuredString(LocalStorageKeys.apiToken)}',
      // 'Accept-Language': SharedPreferencesHelper.getString(
      //   LocalStorageKeys.appLanguage,
      // ),
    };

    print(dio!.options.headers);
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
    // dPrint(dio!.options.headers.toString(), stringColor: StringColor.magenta);
  }

  static void setNewLanguageAfterChanged(String language) {
    dio?.options.headers = {'Accept-Language': language};
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  static void _addDioOptions() {
    dio?.options.baseUrl = Endpoints.baseUrl;
  }
}
