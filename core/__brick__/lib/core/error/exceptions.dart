/// Base class for all custom exceptions
abstract class GenericExceptions implements Exception {
  final String exceptionMessage;

  const GenericExceptions(this.exceptionMessage);

  @override
  String toString() => exceptionMessage;
}

/// Represents server-related exceptions (e.g., backend responses)
class ServerException extends GenericExceptions {
  const ServerException({required String exceptionMessage})
    : super(exceptionMessage);
}

/// Represents caching/data persistence errors
class CacheException extends GenericExceptions {
  const CacheException({required String exceptionMessage})
    : super(exceptionMessage);
}

/// Represents generic fallback exception
class GeneralException extends GenericExceptions {
  const GeneralException({String exceptionMessage = "Something went wrong"})
    : super(exceptionMessage);
}
