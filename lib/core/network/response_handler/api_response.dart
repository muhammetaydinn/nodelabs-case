import 'dart:convert';

/// Generic API response model based on your API structure
/// {
///   "response": {
///     "code": 200,
///     "message": ""
///   },
///   "data": {...}
/// }
class ApiResponse<T> {
  final bool status;
  final String message;
  final int code;
  final T data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  bool get isSuccess => status && code >= 200 && code < 300;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    final responseData = json['response'] as Map<String, dynamic>? ?? {};
    final code = responseData['code'] as int? ?? 500;
    final message = responseData['message']?.toString() ?? '';
    
    // Success is determined by HTTP status code
    final status = code >= 200 && code < 300;

    return ApiResponse<T>(
      status: status,
      message: message,
      code: code,
      data: fromJsonT(json['data']),
    );
  }

  factory ApiResponse.fromJsonString(
    String jsonString,
    T Function(dynamic) fromJsonT,
  ) {
    final json = jsonDecode(jsonString);
    return ApiResponse.fromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'response': {
        'code': code,
        'message': message,
      },
      'data': toJsonT(data),
    };
  }
}

extension ApiResponseListExtension<T> on ApiResponse<List<T>> {
  List<R> mapData<R>(R Function(T) mapper) {
    return data.map(mapper).toList();
  }
}

extension ApiResponseMapExtension<T> on ApiResponse<Map<String, T>> {
  Map<String, R> mapData<R>(R Function(T) mapper) {
    return data.map((key, value) => MapEntry(key, mapper(value)));
  }
}

class ApiException implements Exception {
  final String message;
  final int code;
  final bool status;

  ApiException({
    required this.message,
    required this.code,
    required this.status,
  });

  @override
  String toString() => message;
}

Future<T> throwApiException<T>(Future<T> Function() apiCall) async {
  try {
    return await apiCall();
  } catch (e) {
    if (e is ApiException) {
      rethrow;
    }
    throw ApiException(
      message: e.toString(),
      code: 500,
      status: false,
    );
  }
} 