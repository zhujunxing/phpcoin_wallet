import 'package:date_format/date_format.dart';




class FormatUtil {

  ///取小数点后几位
  ///num 数据
  ///location 几位
  static String formatNum(double num, int location) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        location) {
      //小数点后有几位小数
      return num.toStringAsFixed(location)
          .substring(0, num.toString().lastIndexOf(".") + location + 1)
          .toString();
    } else {
      return num.toString()
          .substring(0, num.toString().lastIndexOf(".") + location + 1)
          .toString();
    }
  }

  static String getTimeFrom(int datetime) {

    String  str="";
    DateTime time = DateTime.fromMillisecondsSinceEpoch(datetime);
    int hours = time.hour;
    // int minute = time.minute;

    if(hours>=1 || hours<=12){
      str="上午";

    }else if(hours>=12 || hours<=16){
      str="下午";

    }else if(hours>=16 || hours<=21){
      str="晚上";
    }else if(hours>=21 || hours<=24){
      str="深夜";
    }
    return str;
  }
  // 发布时间转换


  //获取小时分秒
  static String milliSecToTime(int milliSec) {


    // double min = (millisec / 1000 / 60);
    double hour = (milliSec / 1000 / 60 / 60);
    if(hour>=1){
      String date=formatDate(DateTime.fromMillisecondsSinceEpoch(milliSec), [
        HH,
        ":",
        nn,
        ':',
        ss
      ]);
      return date;
    }else{

      String date=formatDate(DateTime.fromMillisecondsSinceEpoch(milliSec), [
        nn,
        ':',
        ss
      ]);
      return date;
    }

  }
  ///根据日期，返回星座
  static String getConstellation(DateTime birthday) {
    const String capricorn = '摩羯座'; //Capricorn 摩羯座（12月22日～1月20日）
    const String aquarius = '水瓶座'; //Aquarius 水瓶座（1月21日～2月19日）
    const String pisces = '双鱼座'; //Pisces 双鱼座（2月20日～3月20日）
    const String aries = '白羊座'; //3月21日～4月20日
    const String taurus = '金牛座'; //4月21～5月21日
    const String gemini = '双子座'; //5月22日～6月21日
    const String cancer = '巨蟹座'; //Cancer 巨蟹座（6月22日～7月22日）
    const String leo = '狮子座'; //Leo 狮子座（7月23日～8月23日）
    const String virgo = '处女座'; //Virgo 处女座（8月24日～9月23日）
    const String libra = '天秤座'; //Libra 天秤座（9月24日～10月23日）
    const String scorpio = '天蝎座'; //Scorpio 天蝎座（10月24日～11月22日）
    const String sagittarius = '射手座'; //Sagittarius 射手座（11月23日～12月21日）

    int month = birthday.month;
    int day = birthday.day;
    String constellation = '';

    switch (month) {
      case DateTime.january:
        constellation = day < 21 ? capricorn : aquarius;
        break;
      case DateTime.february:
        constellation = day < 20 ? aquarius : pisces;
        break;
      case DateTime.march:
        constellation = day < 21 ? pisces : aries;
        break;
      case DateTime.april:
        constellation = day < 21 ? aries : taurus;
        break;
      case DateTime.may:
        constellation = day < 22 ? taurus : gemini;
        break;
      case DateTime.june:
        constellation = day < 22 ? gemini : cancer;
        break;
      case DateTime.july:
        constellation = day < 23 ? cancer : leo;
        break;
      case DateTime.august:
        constellation = day < 24 ? leo : virgo;
        break;
      case DateTime.september:
        constellation = day < 24 ? virgo : libra;
        break;
      case DateTime.october:
        constellation = day < 24 ? libra : scorpio;
        break;
      case DateTime.november:
        constellation = day < 23 ? scorpio : sagittarius;
        break;
      case DateTime.december:
        constellation = day < 22 ? sagittarius : capricorn;
        break;
    }

    return constellation;
  }


  static String getAge(DateTime brt){
    int age = 0;

    DateTime dateTime = DateTime.now();

    int yearNow = dateTime.year;  //当前年份
    int monthNow = dateTime.month;  //当前月份
    int dayOfMonthNow = dateTime.day; //当前日期

    int yearBirth = brt.year;
    int monthBirth = brt.month;
    int dayOfMonthBirth = brt.day;
    age = yearNow - yearBirth;   //计算整岁数
    if (monthNow <= monthBirth) {
      if (monthNow == monthBirth) {
        if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
      } else {
        age--;//当前月份在生日之前，年龄减一
      }
    }
    return age.toString();
  }


  ///得到文件大小
  getFormatFileSize(int limit) {
    String size = "";
    //内存转换
    if (limit < 0.1 * 1024) { //小于0.1KB，则转化成B
      size = limit.toString();
      size = size.substring(0, size.indexOf(".") + 3) + "  B";
    } else if (limit < 0.1 * 1024 * 1024) { //小于0.1MB，则转化成KB
      size = (limit / 1024).toString();
      size = size.substring(0, size.indexOf(".") + 3) + "  KB";
    } else if (limit < 0.1 * 1024 * 1024 * 1024) { //小于0.1GB，则转化成MB
      size = (limit / (1024 * 1024)).toString();
      size = size.substring(0, size.indexOf(".") + 3) + "  MB";
    } else { //其他转化成GB
      size = (limit / (1024 * 1024 * 1024)).toString();
      size = size.substring(0, size.indexOf(".") + 3) + "  G";
    }
    return size;
  }

}
