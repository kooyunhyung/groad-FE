import 'dart:math';

class APIConfig {
  final String host;
  final int version;

  APIConfig(this.host, {this.version});
}

final bool dev = false;

final host = dev
    ? APIConfig('http://222.113.31.130:8080', version: 1)
// 주소 변경 시 아래의 부분만 변경하면 됩니다.
    : APIConfig('https://api.telliot.co.kr', version: 1);

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

  // 이 부분도 필요하시다면 변경하시고 사용하시면 됩니다.
  return '${host.host}/v${host.version}$path?${params.substring(min(params.length, 1))}';
}
