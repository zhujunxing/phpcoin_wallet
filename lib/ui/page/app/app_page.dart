
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../../controller/page/app/app_controller.dart';
import '../../../lang/translation_service.dart';
import '../../../res/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/color_util.dart';



// ignore: must_be_immutable
class AppPage extends StatelessWidget {

  late AppController controller = Get.put(AppController());

  AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          title: "PHPCoin",
          logWriterCallback: LogWriter.write,
          getPages: AppPages.routes,
          locale: controller.loadLocale(),
          initialRoute: Routes.root,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          defaultTransition: Transition.cupertino,
          themeMode: ThemeMode.light,
          localizationsDelegates: const [
            CommonLocalizationsDelegate(), //解决cup 不是支持中文
          ],

          theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: ColorUtil.createMaterialColor(Colours.accentColor),
            primaryColor: Colors.white,
            colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colours.accentColor),
            primaryColorBrightness: Brightness.light,
            highlightColor: Colors.transparent,
            splashColor: Colours.loadingColor,
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: Colours.accentColor.withOpacity(0.5),
              cursorColor: Colours.accentColor.withOpacity(0.6),
              selectionHandleColor: Colours.accentColor.withOpacity(1),
            ),
          ),

        );
      },
    );
  }

}

///日志
mixin LogWriter {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask((){
       // logger.i(text);
    }

    );
  }
}


///语言(主要解决cupertino控件不能显示中文的问题)
class CommonLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const CommonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>['zh', 'CN'].contains(locale.languageCode);

  @override
  SynchronousFuture<_DefaultCupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<_DefaultCupertinoLocalizations>(
        _DefaultCupertinoLocalizations(locale.languageCode));
  }

  @override
  bool shouldReload(CommonLocalizationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends CupertinoLocalizations {
  _DefaultCupertinoLocalizations(this._languageCode);

  // ignore: unused_field
  final String _languageCode;

  static const List<String> _shortWeekdays = <String>[
    '周一',
    '周二',
    '周三',
    '周四',
    '周五',
    '周六',
    '周日',
  ];

  static const List<String> _shortMonths = <String>[
    '一月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '十一月',
    '十二月',
  ];

  static const List<String> _months = <String>[
    '一月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '十一月',
    '十二月',
  ];

  @override
  String get alertDialogLabel => '提醒';

  @override
  String get anteMeridiemAbbreviation => "上午";

  @override
  String get postMeridiemAbbreviation => "下午";

  @override
  String get copyButtonLabel => "复制";

  @override
  String get cutButtonLabel => "剪切";

  @override
  String get pasteButtonLabel => "粘贴";

  @override
  String get selectAllButtonLabel => "全选";

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString();

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) return '1 分钟';
    return minute.toString() + ' 分钟';
  }

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerHourLabel(int hour) => '时';

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerMinuteLabel(int minute) => '分';

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerSecondLabel(int second) => '秒';

  @override
  String get todayLabel => "今天";

  @override
  String get modalBarrierDismissLabel => "取消";

  @override
  String tabSemanticsLabel({int? tabIndex, int? tabCount}) {
    throw "选中";
  }

  @override
  String get searchTextFieldPlaceholderLabel => "搜索";

  @override
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  List<String> get timerPickerSecondLabels => throw UnimplementedError();
}