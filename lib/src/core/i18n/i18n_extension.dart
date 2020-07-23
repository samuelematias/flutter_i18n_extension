import 'package:flutter_i18n_extension/src/core/i18n/translations/i18n_translations.dart';
import 'package:flutter_i18n_extension/src/core/storage/storage.dart';

extension InternationalizationExtesntion on String {
  String i18n({String lang = ""}) {
    // If want use by device locale
    // final String _languageCode =
    //     (lang == null || lang.isEmpty) ? getLocaleStr(getDeviceLocale.languageCode) : lang;

    // If want use only single language
    // final String _languageCode =
    //     (lang == null || lang.isEmpty) ? kDefaultLocaleStr : lang;

    final String _languageCode =
        (lang == null || lang.isEmpty) ? StoredSettings.getLocaleKey() : lang;

    final Map<String, Map<String, String>> dic = {
      "en_us": enUS,
      "es_mx": esMX,
      "pt_br": ptBR,
    };

    return dic[_languageCode][this];
  }
}
