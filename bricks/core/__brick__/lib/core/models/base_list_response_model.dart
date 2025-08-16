// import 'package:json_annotation/json_annotation.dart';

// part 'base_list_response_model.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class BaseListResponseModel<T> {
//   final String? message;
//   final String? status;
//   final List<T> data;

//   const BaseListResponseModel({
//     required this.message,
//     required this.status,
//     required this.data,
//   });

//   factory BaseListResponseModel.fromJson(
//     Map<String, dynamic> json,
//     T Function(Object? json) fromJsonT,
//   ) {
//     final list = json['data'] as List;
//     return BaseListResponseModel<T>(
//       message: json['message'] as String?,
//       status: json['status'] as String?,
//       data: list.map((e) => fromJsonT(e)).toList(),
//     );
//   }

//   Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
//       _$BaseListResponseModelToJson(this, toJsonT);
// }
