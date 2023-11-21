import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:old/core/services/i_network_service.dart';

typedef Headers = Map<String, dynamic>;
typedef JSON = Map<String, dynamic>;

class NetworkService extends INetworkService {
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
        return _get(uri, headers: mergedHeaders);
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
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _post<T>(String uri, {Headers? headers}) async {
    final response = await http.post(
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _put<T>(String uri, {Headers? headers}) async {
    final response = await http.put(
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _delete<T>(String uri, {Headers? headers}) async {
    final response = await http.delete(
      Uri.dataFromString(uri),
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
