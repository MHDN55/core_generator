// import 'package:json_annotation/json_annotation.dart';

// part 'base_response_model.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class BaseResponseModel<T> {
//   final String? message;
//   final String? status;
//   final T? data;

//   const BaseResponseModel({
//     required this.message,
//     required this.status,
//     required this.data,
//   });

//   factory BaseResponseModel.fromJson(
//     Map<String, dynamic> json,
//     T Function(Object? json) fromJsonT,
//   ) {
//     final dynamic rawData = json['data'];
//     final T parsedData = fromJsonT(rawData);

//     return BaseResponseModel<T>(
//       message: json['message'] as String?,
//       status: json['status'] as String?,
//       data: parsedData,
//     );
//   }

//   Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
//       _$BaseResponseModelToJson(this, toJsonT);
// }
