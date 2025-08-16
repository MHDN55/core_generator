import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../error/error_handler.dart';
import '../../error/exceptions.dart';
import '../../models/base_model.dart';
import '../../network/dio_factory.dart';
import '../../utils/constants.dart';
import '../local/shared_preferences_helper.dart';
import 'base_remote_data_source.dart';

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  @protected
  final Dio _dio = DioFactory.getDio();

  @override
  Future<BaseModel<T>> performGetRequest<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      DioFactory.setTokenIntoHeaderAfterLogin(
        await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.apiToken,
        ),
      );
      final response = await _dio.get<dynamic>(
        endpoint,
        queryParameters: queryParameters,
      );

      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> jsonMap =
            response.data as Map<String, dynamic>;

        final BaseModel<T> baseModel = BaseModel<T>.fromJson(
          jsonMap,
          fromJsonT,
        );

        if (response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300) {
          return baseModel;
        } else {
          throw ServerException(
            exceptionMessage: jsonMap['message'] ?? 'Unexpected server error',
          );
        }
      } else {
        throw const ServerException(
          exceptionMessage: "Invalid response format",
        );
      }
    } catch (e, stackTrace) {
      print("❌ Exception caught in performGetRequest: $e");
      print("📛 Stack trace:\n$stackTrace");
      throw ErrorHandler.handleExceptionError(e);
    }
  }

  @override
  Future<BaseModel<T>> performPostRequest<T>({
    required String endpoint,
    Map? body,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) async {
    _dio.options.headers = {'X-Request-Name': endpoint};
    try {
      DioFactory.setTokenIntoHeaderAfterLogin(
        await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.apiToken,
        ),
      );
      final Response<Map<String, dynamic>> response = await _dio.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );

      if (response.data != null) {
        final BaseModel<T> baseModel = BaseModel<T>.fromJson(
          response.data!,
          fromJsonT,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return baseModel;
        } else {
          throw ServerException(exceptionMessage: response.data!['message']);
        }
      } else {
        throw const ServerException(exceptionMessage: "Something went wrong");
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }

  @override
  Future<BaseModel<T>> performPatchRequest<T>({
    required String endpoint,
    FormData? body,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      DioFactory.setTokenIntoHeaderAfterLogin(
        await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.apiToken,
        ),
      );
      final Response<Map<String, dynamic>> response = await _dio.patch(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final BaseModel<T> baseModel = BaseModel<T>.fromJson(
          response.data!,
          fromJsonT,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return baseModel;
        } else {
          throw ServerException(exceptionMessage: response.data!['message']);
        }
      } else {
        throw const ServerException(exceptionMessage: "Something went wrong");
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }

  @override
  Future<BaseModel<T>> performDeleteRequest<T>({
    required String endpoint,
    FormData? body,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  }) async {
    try {
      DioFactory.setTokenIntoHeaderAfterLogin(
        await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.apiToken,
        ),
      );
      final Response<Map<String, dynamic>> response = await _dio.delete(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final BaseModel<T> baseModel = BaseModel<T>.fromJson(
          response.data!,
          fromJsonT,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return baseModel;
        } else {
          throw ServerException(exceptionMessage: response.data!['message']);
        }
      } else {
        throw const ServerException(exceptionMessage: "Something went wrong");
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }
}

// @LazySingleton(as: BaseRemoteDataSource)
// class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
//   final Dio dio;

//   BaseRemoteDataSourceImpl(this.dio);

//   @override
//   Future<T> performPostRequest<T>({
//     required String endpoint,
//     required int language,
//     dynamic data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     AppHelper.dPrint("performPostRequest\nSending request...\n");
//     return _handleRequest<T>(
//       request: dio.post(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: GetOptions.getOptionsWithToken(token, language: language),
//       ),
//       fromJsonT: fromJsonT,
//     );
//   }

//   @override
//   Future<T> performPutRequest<T>({
//     required String endpoint,
//     required int language,
//     dynamic data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     AppHelper.dPrint("performPutRequest\nSending request...\n");
//     return _handleRequest<T>(
//       request: dio.put(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: GetOptions.getOptionsWithToken(token, language: language),
//       ),
//       fromJsonT: fromJsonT,
//     );
//   }

//   @override
//   Future<T> performDeleteRequest<T>({
//     required String endpoint,
//     required int language,
//     dynamic data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     AppHelper.dPrint("performDeleteRequest\nSending request...\n");
//     return _handleRequest<T>(
//       request: dio.delete(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: GetOptions.getOptionsWithToken(token, language: language),
//       ),
//       fromJsonT: fromJsonT,
//     );
//   }

//   @override
//   Future<T> performGetRequest<T>({
//     required String endpoint,
//     required int language,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     int isPaginate = 0,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     AppHelper.dPrint("performGetRequest\nSending request...\n");
//     return _handleRequest<T>(
//       request: dio.get(
//         endpoint,
//         queryParameters: queryParameters,
//         options: GetOptions.getOptionsWithToken(
//           token,
//           language: language,
//           isPagination: isPaginate,
//         ),
//       ),
//       fromJsonT: fromJsonT,
//     );
//   }

//   @override
//   Future<List<T>> performGetListRequest<T>({
//     required String endpoint,
//     required int language,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     bool methodIsPost = false,
//     dynamic data,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     AppHelper.dPrint("performGetListRequest\nSending request...\n");

//     final request = methodIsPost
//         ? dio.post(
//             endpoint,
//             data: data,
//             queryParameters: queryParameters,
//             options: GetOptions.getOptionsWithToken(token, language: language),
//           )
//         : dio.get(
//             endpoint,
//             queryParameters: queryParameters,
//             options: GetOptions.getOptionsWithToken(token, language: language),
//           );

//     return _handleListRequest<T>(
//       request: request,
//       fromJsonT: fromJsonT,
//     );
//   }

//   Future<T> _handleRequest<T>({
//     required Future<Response> request,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     try {
//       final response = await request;

//       AppHelper.dPrint("Decoding response...");
//       final jsonMap = response.data is String
//           ? json.decode(response.data)
//           : response.data;

//       final result = BaseResponseModel<T>.fromJson(jsonMap, fromJsonT);

//       if (result.status == 'true' || result.status == '200 OK') {
//         AppHelper.dPrint("✅ Success response");
//         return result.data as T;
//       } else {
//         throw Exception(result.message ?? 'Unknown error');
//       }
//     } on DioException catch (e) {
//       AppHelper.dPrint("❌ DioException: ${e.message}");
//       throw Exception(e.response?.data.toString() ?? 'Dio error');
//     } catch (e) {
//       AppHelper.dPrint("❌ General error: $e");
//       rethrow;
//     }
//   }

//   Future<List<T>> _handleListRequest<T>({
//     required Future<Response> request,
//     required T Function(Object? json) fromJsonT,
//   }) async {
//     try {
//       final response = await request;

//       AppHelper.dPrint("Decoding list response...");
//       final jsonMap = response.data is String
//           ? json.decode(response.data)
//           : response.data;

//       final result = BaseListResponseModel<T>.fromJson(jsonMap, fromJsonT);

//       if (result.status == 'true' || result.status == '200 OK') {
//         AppHelper.dPrint("✅ Success list response");
//         return result.data;
//       } else {
//         throw Exception(result.message ?? 'Unknown error');
//       }
//     } on DioException catch (e) {
//       AppHelper.dPrint("❌ DioException (List): ${e.message}");
//       throw Exception(e.response?.data.toString() ?? 'Dio list error');
//     } catch (e) {
//       AppHelper.dPrint("❌ General list error: $e");
//       rethrow;
//     }
//   }
// }

// class GetOptions {
//   static Options options = Options();

//   static Options getOptionsWithToken(
//     String? token, {
//     int? language,
//     int isPagination = 0,
//   }) {
//     if (token != null && token.isNotEmpty) {
//       options.headers = {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//         'Accept-Language': language,
//         'is-pagination': isPagination,
//       };
//     } else {
//       options.headers = {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Accept-Language': language,
//       };
//     }
//     return options;
//   }
// }
