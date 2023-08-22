import 'dart:math';

class APIConfig {
  final String host;
  final int version;

  APIConfig(this.host, {this.version});
}

final host = APIConfig('http://{HOST_IP_ADDRESS}', version: 1);


String getQueryString(Map params,
    {String prefix = '&', bool inRecursion = false}) {
  var query = '';

  params.forEach((key, value) {
    if (inRecursion) {
      key = '[$key]';
    }

    if (value is String || value is int || value is double || value is bool) {
      query += '$prefix$key=${Uri.encodeQueryComponent(value.toString())}';
    } else if (value is List || value is Map) {
      if (value is List) value = value.asMap();
      value.forEach((k, v) {
        query +=
            getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
      });
    }
  });

  return query;
}

String createUri(String path, Map<String, dynamic> param) {
  final params = param != null ? getQueryString(param) : '';

  print('${host.host}/$path?${params.substring(min(params.length, 1))}');
  // 이 부분도 필요하시다면 변경하시고 사용하시면 됩니다.
  return '${host.host}/$path?${params.substring(min(params.length, 1))}';
}
