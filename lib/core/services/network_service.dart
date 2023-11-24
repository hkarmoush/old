import 'dart:convert';
import 'package:http/http.dart' as http;

typedef Headers = Map<String, String>;
typedef JSON = Map<String, dynamic>;

enum HttpMethods { get, post, put, delete }

abstract class NetworkingService {
  NetworkingService({
    required this.baseUrl,
    required this.defaultHeaders,
    required this.key,
  });

  final String baseUrl;
  final Headers? defaultHeaders;
  final String key;

  Future<T> request<T>(
    String endpoint, {
    required HttpMethods method,
    Headers? headers,
  });
}

class NetworkService extends NetworkingService {
  NetworkService({
    required super.baseUrl,
    required super.key,
    super.defaultHeaders,
  });

  @override
  Future<T> request<T>(
    String endpoint, {
    required HttpMethods method,
    Headers? headers,
  }) async {
    final uri = '${super.baseUrl}/$endpoint';
    final mergedHeaders = _mergeHeaders(defaultHeaders, headers);

    switch (method) {
      case HttpMethods.get:
        return _get<T>(uri, headers: mergedHeaders);
      case HttpMethods.post:
        return _post(uri, headers: mergedHeaders);
      case HttpMethods.put:
        return _put(uri, headers: mergedHeaders);
      case HttpMethods.delete:
        return _delete(uri, headers: mergedHeaders);
    }
  }

  Future<T> _get<T>(String uri, {Headers? headers}) async {
    final response = await http.get(
      Uri.parse(uri),
      // headers: headers,
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _post<T>(String uri, {Headers? headers}) async {
    final response = await http.post(
      Uri.parse(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _put<T>(String uri, {Headers? headers}) async {
    final response = await http.put(
      Uri.parse(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _delete<T>(String uri, {Headers? headers}) async {
    final response = await http.delete(
      Uri.parse(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Headers? _mergeHeaders(
    Headers? defaultHeaders,
    Headers? customHeaders,
  ) {
    final mergedHeaders = {...?defaultHeaders, ...?customHeaders};
    return mergedHeaders.isNotEmpty ? mergedHeaders : null;
  }

  T _parseResponse<T>(String responseBody) {
    if (T == String) {
      return responseBody as T;
    } else if (T == JSON) {
      return json.decode(responseBody) as T;
    } else if (T == List<JSON>) {
      final decodedList = json.decode(responseBody) as Iterable<dynamic>;
      return List<JSON>.from(decodedList) as T;
    } else {
      throw Exception('Unsupported type: $T');
    }
  }
}
