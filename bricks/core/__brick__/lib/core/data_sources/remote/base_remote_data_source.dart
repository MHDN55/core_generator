import 'package:dio/dio.dart';

import '../../models/base_model.dart';

abstract class BaseRemoteDataSource {
  Future<BaseModel<T>> performGetRequest<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  });

  Future<BaseModel<T>> performPostRequest<T>({
    required String endpoint,
    Map? body,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  });

  Future<BaseModel<T>> performPatchRequest<T>({
    required String endpoint,
    FormData? body,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  });

  Future<BaseModel<T>> performDeleteRequest<T>({
    required String endpoint,
    FormData? body,
    Map<String, dynamic>? queryParameters,
    required T Function(Object? json) fromJsonT,
  });
}




















//  import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';

// abstract class BaseRemoteDataSource {
//   Future<T> performGetRequest<T>({
//     required String endpoint,
//     required int language,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     int isPaginate = 0,
//     required T Function(Object? json) fromJsonT,
//   });

//   Future<T> performPostRequest<T>({
//     required String endpoint,
//     required int language,
//     dynamic data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     required T Function(Object? json) fromJsonT,
//   });

//   Future<T> performPutRequest<T>({
//     required String endpoint,
//     required int language,
//     dynamic data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     required T Function(Object? json) fromJsonT,
//   });

//   Future<T> performDeleteRequest<T>({
//     required String endpoint,
//     required int language,
//     dynamic data,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     required T Function(Object? json) fromJsonT,
//   });

//   Future<List<T>> performGetListRequest<T>({
//     required String endpoint,
//     required int language,
//     String? token,
//     Map<String, dynamic>? queryParameters,
//     bool methodIsPost = false,
//     dynamic data,
//     required T Function(Object? json) fromJsonT,
//   });
// }
