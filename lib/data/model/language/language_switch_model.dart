/// title : ""
/// languageCode : ""
/// countryCode : ""
/// isSelected : false

class LanguageSwitchModel {
  String? title;
  String? languageCode;
  String? countryCode;
  bool? isSelected;

  static LanguageSwitchModel? fromMap(Map<dynamic, dynamic> map) {

    LanguageSwitchModel languageSwitchModelBean = LanguageSwitchModel();
    languageSwitchModelBean.title = map['title'];
    languageSwitchModelBean.languageCode = map['languageCode'];
    languageSwitchModelBean.countryCode = map['countryCode'];
    languageSwitchModelBean.isSelected = map['isSelected'];
    return languageSwitchModelBean;
  }

  Map toJson() => {
    "title": title,
    "languageCode": languageCode,
    "countryCode": countryCode,
    "isSelected": isSelected,
  };
}