import 'package:resume/I18n/messages.dart';
import 'package:resume/I18n/translations.dart';

class English implements AppTranslationsKeys {
  @override
  Map<String, String> get keys => {
    Messages.title: 'Welcome Swan Flutter Store',
    Messages.welcome: 'Welcome to our amazing Flutter package!',
    Messages.buyPackage: 'Buy Package',
  };
}
