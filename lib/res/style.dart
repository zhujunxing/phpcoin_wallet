import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';


class TextStyles {
  //动态栏标题
  static TextStyle actionTitle = TextStyle(
    fontSize: Dimens.sp16,
    color: Colours.defaultTextColor,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.alphabetic,
  );

  //默认文字
  static TextStyle normalText = TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.normal,
    color: Colours.defaultTextColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //
  static TextStyle normalBoldText = TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.w500,
    color: Colours.defaultTextColor,
    textBaseline: TextBaseline.alphabetic,
  );

  //默认大文字
  static TextStyle largeText = TextStyle(
    fontSize: Dimens.sp16,
    fontWeight: FontWeight.normal,
    color: Colours.defaultTextColor,
    textBaseline: TextBaseline.alphabetic,
  );

  //默认大文字-粗体
  static TextStyle largeBoldText = TextStyle(
    fontSize: Dimens.sp16,
    fontWeight: FontWeight.w500,
    color: Colours.defaultTextColor,
    textBaseline: TextBaseline.alphabetic,
  );

  //默认浅灰色文字
  static TextStyle normalLightText = TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.normal,
    color: Colours.grayColor,
    textBaseline: TextBaseline.alphabetic,
  );

  //小-浅灰色文字
  static TextStyle smallLightText = TextStyle(
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
    color: Colours.grayColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //小-文字
  static TextStyle smallText = TextStyle(
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
    color: Colours.defaultTextColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //小-文字
  static TextStyle smallBoldText = TextStyle(
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.w500,
    color: Colours.defaultTextColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //默认红色文字
  static TextStyle normalRedText = TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.normal,
    color: Colours.redColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //大-默认红色文字
  static TextStyle largeRedText = TextStyle(
    fontSize: Dimens.sp16,
    fontWeight: FontWeight.normal,
    color: Colours.redColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //小-浅灰色文字-中间划线
  static TextStyle smallLightLineThroughText = TextStyle(
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
    color: Colours.grayColor,
    textBaseline: TextBaseline.alphabetic,
    decorationStyle: TextDecorationStyle.solid,
    decorationColor: Colours.grayColor,
    decoration: TextDecoration.lineThrough,
  );
  //小-默认红色文字
  static TextStyle smallRedText = TextStyle(
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
    color: Colours.redColor,
    textBaseline: TextBaseline.alphabetic,
  );

  //默认白色文字
  static TextStyle normalWhiteText =  TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );
  //默认白色文字
  static TextStyle smallWhiteText =  TextStyle(
    fontSize: Dimens.sp12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );
  //默认文字
  static TextStyle normalAccentText =  TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.normal,
    color: Colours.accentColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //默认文字
  static TextStyle normalBoldAccentText =  TextStyle(
    fontSize: Dimens.sp14,
    fontWeight: FontWeight.w500,
    color: Colours.accentColor,
    textBaseline: TextBaseline.alphabetic,
  );
  static TextStyle largeAccentText =  TextStyle(
    fontSize: Dimens.sp16,
    fontWeight: FontWeight.normal,
    color: Colours.accentColor,
    textBaseline: TextBaseline.alphabetic,
  );
  //大点文字
  static TextStyle largeBoldAccentText =  TextStyle(
    fontSize: Dimens.sp16,
    fontWeight: FontWeight.w500,
    color: Colours.accentColor,
    textBaseline: TextBaseline.alphabetic,
  );
}

class Dimens {
  
  static  double sp2=2.w;

  static  double sp4=4.w;
  static  double sp5=5.w;
  static  double sp6=6.w;
  static  double sp8=8.w;

  
  static  double sp10=10.w;
  static  double sp11=11.w;

  static  double sp12=12.w;
  static  double sp13=13.w;

  static  double sp14=14.w;
  static  double sp15=15.w;
  static  double sp16=16.w;
  static  double sp18=18.w;
  static  double sp20=20.w;
  static  double sp24=24.w;
  static  double sp32=32.w;
  static  double sp28=28.w;

  static  double sp34=34.w;


  static  double dp05 = 0.5.w;
  static  double dp1 = 1.w;
  static  double dp2 = 2.w;
  static  double dp3 = 3.w;
  static  double dp4 = 4.w;
  static  double dp5 = 5.w;
  static  double dp6 = 6.w;
  static  double dp7 = 7.w;
  static  double dp8 = 8.w;
  static  double dp10 = 10.w;
  static  double dp12 = 12.w;
  static  double dp13 = 13.w;
  static  double dp14 = 14.w;
  static  double dp15 = 15.w;
  static  double dp16 = 16.w;
  static  double dp18 = 18.w;
  static  double dp20 = 20.w;
  static  double dp22 = 22.w;


  static  double dp24 = 24.w;
  static  double dp25 = 25.w;

  static  double dp30 = 30.w;
  static  double dp35 = 35.w;
  static  double dp40 = 40.w;
  static  double dp42 = 42.w;
  static  double dp44 = 44.w;
  static  double dp45 = 45.w;
  static  double dp50 = 50.w;
  static  double dp55 = 55.w;
  static  double dp60 = 60.w;
  static  double dp65 = 65.w;
  static  double dp70 = 70.w;
  static  double dp80 = 80.w;
  static  double dp90 = 90.w;
  static  double dp100 = 100.w;

  static  double dp110= 110.w;
  static  double dp120= 120.w;
  static  double dp140= 140.w;
  static  double dp150= 150.w;
  static  double dp160= 160.w;
  static  double dp170= 170.w;
  static  double dp200= 200.w;
  static  double dp210= 210.w;
  static  double dp220= 220.w;
  static  double dp230 = 230.w;
  static  double dp240 = 240.w;
  static  double dp250 = 250.w;
  static  double dp280 = 280.w;
  static  double dp290 = 290.w;
  static  double dp300 = 300.w;
  static  double dp330 = 330.w;

  static  double dp360 = 360.w;
  static  double dp370 = 370.w;
  static  double dp400 = 400.w;
  static  double dp500 = 500.w;
  static  double dp690 = 690.w;


}
class Gradients {
  static LinearGradient myselfRunning = LinearGradient(
    colors: [
      Colours.redColor,
      Colours.redColor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}

class BoxDecorations{


   static BoxDecoration blackMaskBg=BoxDecoration(
       gradient: LinearGradient(
         colors: [
           Colors.black.withOpacity(0.5),
           Colors.black.withOpacity(0.0),
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
       )
   );
   static BoxDecoration tagNoSelectBg=BoxDecoration(
     borderRadius: BorderRadius.circular(Dimens.dp20),
       gradient: LinearGradient(
         colors: [
           Colours.tagBtBgColor,
           Colours.tagBtBgColor,
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
       )
   );
   static BoxDecoration tagSelectedBg=BoxDecoration(
       borderRadius: BorderRadius.circular(Dimens.dp20),
       gradient: LinearGradient(
         colors: [
           Colours.accentColor,
           Colours.accentColor,
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
       )
   );
}

// 间隔
class Gaps {
  static getHGap(double px) {
    return SizedBox(width: px);
  }

  static getVGap(double px) {
    return SizedBox(height: px);
  }

  /// 水平间隔
  static Widget wGap2 = SizedBox(width: 2.w);
  static Widget wGap4 = SizedBox(width: 4.w);

  static Widget wGap5 = SizedBox(width: 5.w);
  static Widget wGap8 =  SizedBox(width: 8.w);
  static Widget wGap10 =  SizedBox(width: 10.w);
  static Widget wGap12 =  SizedBox(width: 12.w);
  static Widget wGap15 =  SizedBox(width: 15.w);
  static Widget wGap20 = SizedBox(width: 20.w);
  static Widget wGap25 =  SizedBox(width: 25.w);
  static Widget wGap30 =  SizedBox(width: 30.w);
  static Widget wGap35 =  SizedBox(width: 35.w);
  static Widget wGap40 =  SizedBox(width: 40.w);
  static Widget wGap45 =  SizedBox(width: 45.w);
  static Widget wGap50 =  SizedBox(width: 50.w);
  static Widget wGap60 =  SizedBox(width: 60.w);
  /// 垂直间隔
   static Widget hGap2 =  SizedBox(height: 2.w);
  static Widget hGap4 =  SizedBox(height: 4.w);
  static Widget hGap5 =  SizedBox(height: 5.w);
  static Widget hGap6 =  SizedBox(height: 6.w);
  static Widget hGap7 =  SizedBox(height: 7.w);
  static Widget hGap10 =  SizedBox(height: 10.w);
  static Widget hGap15 =  SizedBox(height: 15.w);
  static Widget hGap20 =  SizedBox(height: 20.w);
  static Widget hGap25 =  SizedBox(height: 25.w);
  static Widget hGap30 =  SizedBox(height: 30.w);
  static Widget hGap35 =  SizedBox(height: 35.w);
  static Widget hGap36 =  SizedBox(height: 36.w);
  static Widget hGap40 =  SizedBox(height: 40.w);
  static Widget hGap45 =  SizedBox(height: 45.w);
  static Widget hGap50 =  SizedBox(height: 50.w);
  static Widget hGap55 =  SizedBox(height: 55.w);
  static Widget hGap60 =  SizedBox(height: 60.w);
  static Widget hGap65 =  SizedBox(height: 65.w);
  static Widget hGap70 =  SizedBox(height: 70.w);
  static Widget hGap75 =  SizedBox(height: 75.w);
  static Widget hGap80 =  SizedBox(height: 80.w);
  static Widget hGap85 =  SizedBox(height: 85.w);
  static Widget hGap90 =  SizedBox(height: 90.w);
  static Widget hGap95 =  SizedBox(height: 95.w);
  static Widget hGap100 =  SizedBox(height: 100.w);
  static Widget hGap120 =  SizedBox(height: 120.w);
  static Widget hGap130 =  SizedBox(height: 130.w);
  static Widget hGap140 =  SizedBox(height: 140.w);
  static Widget hGap145 =  SizedBox(height: 145.w);
  static Widget hGap160 =  SizedBox(height: 160.w);
  static Widget hGap170 =  SizedBox(height: 170.w);
  static Widget hGap180 =  SizedBox(height: 180.w);
  static Widget hGap200 =  SizedBox(height: 200.w);
  static Widget hGap210 =  SizedBox(height: 210.w);


}

