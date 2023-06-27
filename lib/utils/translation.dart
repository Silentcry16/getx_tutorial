import 'package:get/get.dart';

class MyTranslation extends Translations {
  static const message = 'message';
  static const appBar = 'appBar';
  static const translationTitle = 'lang';
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          translationTitle: 'Choose your language',
          message: 'here I talk about my experiences in flutter world',
          appBar: 'English format'
        },
        'fa_IR': {
          translationTitle: 'لطفا زبان مورد نظر خود را انتخاب کنید',
          message: 'در اینجا درباره تجربیاتم در دنیای فلاتر صحبت می‌کنم',
          appBar: 'فرمت فارسی',
        },
      };
}
