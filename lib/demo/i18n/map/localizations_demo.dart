import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LocalizationsDemo {
  final Locale locale;

  LocalizationsDemo(this.locale);

  static LocalizationsDemo of(BuildContext context) {
    return Localizations.of<LocalizationsDemo>(
      context,
      LocalizationsDemo
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class NinghaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<LocalizationsDemo> {
  NinghaoDemoLocalizationsDelegate();

  @override
  Future<LocalizationsDemo> load(Locale locale) {
    return SynchronousFuture<LocalizationsDemo>(
        LocalizationsDemo(locale));
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
