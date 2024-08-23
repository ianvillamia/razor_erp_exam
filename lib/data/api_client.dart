import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:fpdart/fpdart.dart';
import 'package:razor_erp_exam/core/api_exception.dart';
import 'package:razor_erp_exam/core/extensions/map_extensions.dart';

class WeatherApiClient {
  WeatherApiClient(
    this._dio,
  );
  final Dio _dio;

  /// Used for HTTP GET Method
  ///
  /// [isPublicAuth] when using Public token
  Future<Either<ApiException, T>> get<T>(
    String path,
    T Function(Map<String, dynamic>) mapper, {
    String? baseUrl,
    bool isPublicAuth = false,
    bool isIbmApicAuth = false,
    bool isAwsGatewayAuth = true,
    bool isLendingAuth = false,
    String contentType = Headers.jsonContentType,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.safeGet(
      path,
      mapper,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}

extension DioExtensions on Dio {
  Future<Either<ApiException, T>> safeGet<T>(
    String path,
    T Function(Map<String, dynamic>) mapper, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return right(Result.fromResponse(response, mapper).data);
    } on DioException catch (exception) {
      return left(ApiException(
        code: exception.response?.statusCode.toString() ?? '',
        message: exception.response.toString(),
      ));
    }
  }
}

class Failed<T> extends Result<T> implements Exception {
  Failed(this.error) : super(T as T);
  ApiException error;
}

class Result<T> {
  Result(this.data);
  final T data;

  static const String _jsonNodeErrors = 'errors';

  static Result<T> fromResponse<T>(
    Response<dynamic> response,
    T Function(Map<String, dynamic>) mapper,
  ) {
    final responseData = response.data;

    if (responseData == null || responseData.toString().isEmpty) {
      return Result(mapper({}));
    }

    if (responseData[_jsonNodeErrors] != null) {
      return ServerError.fromResponse(response);
    }

    return Result(mapper(responseData));
  }

  static Result<T> fromPlatformResponse<T>(
    dynamic response,
    T Function(Map<String, dynamic>) mapper,
  ) {
    final responseData = response.toString().isNotEmpty
        ? Map<String, dynamic>.from(
            jsonDecode(response) as Map<String, dynamic>,
          )
        : <String, dynamic>{};

    if (responseData[_jsonNodeErrors] != null) {
      return ServerError.fromPlatformException(response);
    }

    return Result(mapper(responseData));
  }
}

class ServerError<T> extends Failed<T> {
  ServerError(super.error);

  factory ServerError.fromResponse(Response<dynamic>? response) {
    try {
      final responseData = response?.data.toString().isNotEmpty == true
          ? Map<String, dynamic>.from(
              jsonDecode(response!.toString()) as Map<String, dynamic>,
            )
          : <String, dynamic>{};

      final code = responseData.containsKey('error')
          ? responseData.toNonNullableString('error')
          : responseData.toNonNullableString('code');

      final description = responseData.containsKey('error_description')
          ? responseData.toNonNullableString('error_description')
          : responseData.toNonNullableString('description');

      return ServerError(
        ApiException(
          code: code,
          message: description,
        ),
      );
    } catch (e) {
      return ServerError(
        ApiException(
          code: 'Possible 502',
          message: e.toString(),
        ),
      );
    }
  }

  factory ServerError.fromPlatformException(dynamic exception) {
    final responseData = exception.toString().isNotEmpty
        ? Map<String, dynamic>.from(jsonDecode(exception))
        : <String, dynamic>{};

    if (responseData.containsKey('errors')) {
      final errors = responseData['errors'] as List<dynamic>;
      final firstError = errors.first as Map<String, dynamic>;
      return ServerError(
        ApiException(
          code: firstError.toNonNullableString('code'),
          message: firstError.toNonNullableString('message'),
        ),
      );
    }

    final code = responseData.containsKey('error')
        ? responseData.toNonNullableString('error')
        : responseData.toNonNullableString('code');

    final description = responseData.containsKey('error_description')
        ? responseData.toNonNullableString('error_description')
        : responseData.toNonNullableString('description');

    return ServerError(
      ApiException(
        code: code,
        message: description,
      ),
    );
  }
}
