class ApiException with ExceptionErrorCode implements Exception {
  ApiException({required this.code, required this.message});

  final String code;
  final String message;
}

mixin ExceptionErrorCode {
  final dataProcessingError = 'DATA_PROCESSING_ERROR';
}
