
A new Flutter project.

# store 模板代码

/*
* 1. 执行命令: flutter packages pub run build_runner build
* 2. 删除之内再生成: flutter packages pub run build_runner build --delete-conflicting-outputs
* 3. 实时更新.g文件: flutter packages pub run build_runner watch
     */

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login.g.dart';

class LoginStore = LoginStoreMobx with _$LoginStore;

abstract class LoginStoreMobx with Store {
// data
@observable
int tabCurrentIndex = 0;
// computed
@computed
String get getToken => 'token';

// methods

@action
void setIconFontSize(double size, int index) {}

@action
void setOrderTabController(TabController controller) {
}
}

# flutter 颜色透明度

00%=FF（不透明）<br>
5%=F2 <br>
10%=E5 <br>
15%=D8 <br>
20%=CC <br>
25%=BF <br>
30%=B2 <br>
35%=A5 <br>
40%=99 <br>
45%=8c <br>
50%=7F <br>
55%=72 <br>
60%=66 <br>
65%=59 <br>
70%=4c <br>
75%=3F <br>
80%=33 <br>
85%=21 <br>
90%=19 <br>
95%=0c <br>
100%=00（全透明）<br>


# 更改顶部状态栏颜色
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);


flutter run -t lib/main_test.dart
flutter build apk -t lib/main_test.dart
flutter build ios -t lib/main_test.dart