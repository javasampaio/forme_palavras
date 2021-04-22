import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class UtilLocalization {
  UtilLocalization(this.locale);

  final Locale locale;

  static UtilLocalization of(BuildContext context) {
    return Localizations.of<UtilLocalization>(context, UtilLocalization);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'pt': {
      'nameOrNickname': 'Nome ou apelido',
      'email': 'E-mail',
      'enter': 'Entrar',
      'skip': 'Pular',
      'fieldArgCannotBeEmpty': 'Campo %s não pode estar vazio.',
      'invalidArg': '%s inválido'
    },
  };

  String get nameOrNickname =>
      _localizedValues[locale.languageCode]['nameOrNickname'];

  String get email => _localizedValues[locale.languageCode]['email'];

  String get enter => _localizedValues[locale.languageCode]['enter'];

  String get skip => _localizedValues[locale.languageCode]['skip'];

  String get fieldArgCannotBeEmpty => _localizedValues[locale.languageCode]['fieldArgCannotBeEmpty'];

  String get invalidArg => _localizedValues[locale.languageCode]['invalidArg'];

}

class UtilLocalizationDelegate extends LocalizationsDelegate<UtilLocalization> {
  const UtilLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['pt'].contains(locale.languageCode);

  @override
  Future<UtilLocalization> load(Locale locale) {
    return SynchronousFuture<UtilLocalization>(UtilLocalization(locale));
  }

  @override
  bool shouldReload(UtilLocalizationDelegate old) => false;
}
