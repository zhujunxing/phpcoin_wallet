import 'dart:convert';

class RouteUtil {
  static String convertJoin(var str) {
    var json = jsonEncode(const Utf8Encoder().convert(str));
    return json;
  }

  static String convertOut(var str) {
    var list = <int>[];

    ///字符串解码
    jsonDecode(str).forEach(list.add);
    String value = const Utf8Decoder().convert(list);
    return value;
  }
}
