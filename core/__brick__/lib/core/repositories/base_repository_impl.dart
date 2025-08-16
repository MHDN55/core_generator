import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// import '../../generated/l10n.dart';
import '../di/dependency_injection.dart';
import '../error/error_handler.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../network/network_info.dart';
import '../utils/app_enums.dart';
import '../utils/app_functions.dart';
import 'base_repository.dart';

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {
  @protected
  final NetworkInfo _networkInfo = getIt<NetworkInfo>();

  @override
  Future<Either<Failure, T>> requestApi<T, TM>(
    Future<TM> Function() apiRequest,
    T Function(TM) converter,
  ) async {
    final bool isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      await Future.delayed(const Duration(milliseconds: 200));
      return Left(
        ServerFailure(
          errorMessage: "",
          //  S.current.networkError
        ),
      );
    }
    try {
      final TM result = await apiRequest(); // apiRequest returns TM
      return Right(converter(result)); // Convert TM to T
    } catch (e) {
      if (e is ServerException) {
        dPrint(
          "Error from Repository: ${e.exceptionMessage}",
          stringColor: StringColor.red,
        );
      } else {
        dPrint("Error from Repository: $e", stringColor: StringColor.red);
      }
      final Failure failure = ErrorHandler.handleFailureError(e);
      return Left(failure);
    }
  }
}
