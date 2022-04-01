
class StringHelper {
  /// 将list拆分
  static List<dynamic> averageAssign(List<dynamic> source, int n) {
    List<List<dynamic>> result = <List<dynamic>>[];

    int sourceLength = source.length;

    int remaider = sourceLength % n; //(先计算出余数)

    int number = sourceLength ~/ n; //然后是商

    int offset = 0; //偏移量
    for (int i = 0; i < n; i++) {
      List<dynamic> value;
      if (remaider > 0) {
        value =
            source.sublist(i * number + offset, (i + 1) * number + offset + 1);
        remaider--;
        offset++;
      } else {
        value = source.sublist(i * number + offset, (i + 1) * number + offset);
      }
      result.add(value);
    }
    return result;
  }




}
