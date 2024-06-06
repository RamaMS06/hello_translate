import 'package:easy_localization/easy_localization.dart';

class UITranslate {
  /// Use .tr() Main function for translate your language keys
  static String get button => 'button'.tr();

  static Map<String, String> translateId = {
    button: 'Tombol',
  };

  static Map<String, String> translateEn = {
    button: 'Button',
  };
}
