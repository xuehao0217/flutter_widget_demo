import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class LocalizationsDemo {
  static LocalizationsDemo of(BuildContext context) {
    return Localizations.of<LocalizationsDemo>(
      context,
      LocalizationsDemo
    );
  }

  static Future<LocalizationsDemo> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return LocalizationsDemo();
    });
  }
  
  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations.',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],
  );
}

class LocalizationsDelegateDemo
    extends LocalizationsDelegate<LocalizationsDemo> {
  LocalizationsDelegateDemo();

  @override
  Future<LocalizationsDemo> load(Locale locale) {
    return LocalizationsDemo.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsDemo> old) {
    return false;
  }
}