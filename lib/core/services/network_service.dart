import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:old/core/services/i_network_service.dart';

class NetworkService extends INetworkService {
  NetworkService({required super.baseUrl, required super.key});

  @override
  Future<T> request<T>(
    String endpoint, {
    required HttpMethods method,
    Map<String, dynamic>? headers,
  }) async {
    final uri = '${super.baseUrl}/$endpoint';
    switch (method) {
      case HttpMethods.get:
        return _get(uri);
      case HttpMethods.post:
        return _post(uri);
      case HttpMethods.put:
        return _put(uri);
      case HttpMethods.delete:
        return _delete(uri);
    }
  }

  Future<T> _get<T>(String uri) async {
    final response = await http.get(
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _post<T>(String uri) async {
    final response = await http.post(
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _put<T>(String uri) async {
    final response = await http.put(
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  Future<T> _delete<T>(String uri) async {
    final response = await http.delete(
      Uri.dataFromString(uri),
    );
    return _parseResponse<T>(response.body);
  }

  T _parseResponse<T>(String responseBody) {
    if (T == String) {
      return responseBody as T;
    } else if (T == Map<String, dynamic>) {
      return json.decode(responseBody) as T;
    } else if (T == List<Map<String, dynamic>>) {
      final decodedList = json.decode(responseBody) as Iterable<dynamic>;
      return List<Map<String, dynamic>>.from(decodedList) as T;
    } else {
      throw Exception('Unsupported type: $T');
    }
  }
}
