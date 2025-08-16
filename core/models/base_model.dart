import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  final String? message;
  @JsonKey(name: "status")
  final String? statusCode;

  final T? data;

  const BaseModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);
}
