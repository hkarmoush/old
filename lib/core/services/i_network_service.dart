abstract class INetworkService {
  INetworkService({
    required this.baseUrl,
    required this.key,
    this.defaultHeaders,
  });

  final String baseUrl;
  final String key;
  final Map<String, dynamic>? defaultHeaders;

  Future<T> request<T>(
    String endpoint, {
    required HttpMethods method,
    Map<String, dynamic>? headers,
  });
}

enum HttpMethods {
  get,
  post,
  put,
  delete,
}
